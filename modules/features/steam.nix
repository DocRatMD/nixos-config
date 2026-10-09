{ self, inputs, ... }: {

  flake.nixosModules.steam = { pkgs, ... }: {
    programs.steam = {
      enable = true;
      extraCompatPackages = [
        pkgs.proton-ge-bin
      ];
      package = pkgs.steam.override {
        extraEnv = {
          MANGOHUD = true;
        };
      };
    };
  };

}
