{ self, inputs, ... }: {

  flake.nixosModules.optimizations = { pkgs, ... }: {
    zramSwap.enable = true;

    boot.kernelModules = [ "ntsync" ];

    services.scx = {
      enable = true;
      scheduler = "scx_lavd";
    };

    programs.gamemode.enable = true;
  };

}
