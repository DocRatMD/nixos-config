{ self, inputs, ... }: {

  flake.homeModules.desktop = { pkgs, config, ... }: {
    imports = [
      # I use sharedModules so all imports are done in configuration.nix
    ];

    #Do not change this
    home.stateVersion = "26.05";
  };

}
