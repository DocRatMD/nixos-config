{ self, inputs, ... }: {
  flake.nixosModules.nvidia = { config, ... }: {
    hardware.graphics.enable = true;
    services.xserver.videoDrivers = [ "nvidia" ];

    environment.sessionVariables = {
      __GL_SHADER_DISK_CACHE_SIZE = "12000000000";
    };
    hardware.nvidia = {
      open = true;
      modesetting.enable = true; #Required for wayland
      package = config.boot.kernelPackages.nvidiaPackages.latest;
    };
  };

}
