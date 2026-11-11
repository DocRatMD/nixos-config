{ self, inputs, ... }: {

  flake.nixosModules.performance = { pkgs, ... }: {
    zramSwap.enable = true;

    boot.kernelModules = [ "ntsync" ];

    services.scx-loader = {
      enable = true;
      config.default_sched = "scx_lavd";
    };

    programs.gamemode.enable = true;
  };

}
