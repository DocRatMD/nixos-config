{ self, inputs, ... }: {

  flake.homeModules.desktop = { pkgs, config, ... }: {
    imports = [
      # I use sharedModules so all imports are done in configuration.nix
    ];

    home.shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake 'path:${config.home.homeDirectory}/nixos-config#desktop'";
    };

    home.stateVersion = "26.05";
  };

}
