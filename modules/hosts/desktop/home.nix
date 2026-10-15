{ self, inputs, ... }: {

  flake.homeModules.desktop = { pkgs, config, ... }: {
    imports = [
      # I use sharedModules so all imports are done in configuration.nix
    ];

    home.stateVersion = "26.05";
  };

}
