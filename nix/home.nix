{ config, lib, pkgs, dotfilesDirectory, ... }:
let
  links = {
    nvim = "nvim";
    wezterm = "wezterm";
    "starship.toml" = "starship/starship.toml";
  };
in
{
  home.stateVersion = "26.05";
  xdg.enable = true;
  # GUI applications are managed by Homebrew.
  targets.darwin.copyApps.enable = false;
  targets.darwin.linkApps.enable = false;

  xdg.configFile = lib.mapAttrs (_: source: {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfilesDirectory}/${source}";
    # The check below permits replacing only symlinks to this exact source.
    force = true;
  }) links;

  home.activation.checkDotfilesLinks = lib.hm.dag.entryBefore [ "checkLinkTargets" ] (
    lib.concatStringsSep "\n" (lib.mapAttrsToList (target: source: ''
      sourcePath=${lib.escapeShellArg "${dotfilesDirectory}/${source}"}
      targetPath=${lib.escapeShellArg "${config.xdg.configHome}/${target}"}
      if [[ ! -e "$sourcePath" ]]; then
        echo "Missing dotfiles source: $sourcePath" >&2
        exit 1
      fi
      if [[ -e "$targetPath" || -L "$targetPath" ]]; then
        if [[ ! -L "$targetPath" ]] || [[ "$(${pkgs.coreutils}/bin/readlink -f "$targetPath")" != "$(${pkgs.coreutils}/bin/readlink -f "$sourcePath")" ]]; then
          echo "Refusing to replace an unrelated config: $targetPath" >&2
          echo "Back it up outside the target path before activating." >&2
          exit 1
        fi
      fi
    '') links)
  );
}
