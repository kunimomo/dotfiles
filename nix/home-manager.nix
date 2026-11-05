{ config, lib, ... }:
let
  user = config.system.primaryUser;
in
{
  options.dotfiles.directory = lib.mkOption {
    type = lib.types.addCheck lib.types.str (lib.hasPrefix "/");
    description = "Absolute path to the editable dotfiles checkout.";
  };

  config.home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs.dotfilesDirectory = config.dotfiles.directory;
    users.${user} = {
      imports = [ ./home.nix ];
      home.username = user;
      home.homeDirectory = config.users.users.${user}.home;
    };
  };
}
