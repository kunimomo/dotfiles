{
  imports = [ ./homebrew.nix ./home-manager.nix ./local.nix ];

  nixpkgs.hostPlatform = "aarch64-darwin";

  # Keep the build group ID from the existing Nix installation.
  ids.gids.nixbld = 30000;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Compatibility baseline for this first nix-darwin installation.
  # Do not change this when updating flake inputs.
  system.stateVersion = 6;
}
