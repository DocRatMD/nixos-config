{ self, inputs, ... }: {

  flake.nixosModules.performance = { pkgs, ... }: {
    zramSwap.enable = true;

    boot.kernelModules = [ "ntsync" ];

    services.scx = {
      enable = true;
      scheduler = "scx_lavd";
    };

    programs.gamemode.enable = true;
  };

}
