{ self, inputs, ... }: {
  flake.nixosModules.nvidia = { config, ... }: {
    hardware.graphics.enable = true;
    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia = {
      open = true;
      modesetting.enable = true; #Required for wayland
      package = config.boot.kernelPackages.nvidiaPackages.latest;
    };

  };

}
