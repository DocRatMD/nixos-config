{ self, inputs, ... }: {

  flake.nixosModules.limine = { pkgs, ... }: {
    boot.loader.limine = {
      enable = true;
      maxGenerations = 5;

      # Make this false for the first install, then set it to true
      # once the keys exist and are enrolled.
      secureBoot.enable = true;

      style = {
        wallpapers = [ ../../assets/wallpapers/static/limine-splash.png ];
        wallpaperStyle = "stretched";

        interface = {
          branding = "";
        };

        graphicalTerminal = {
          margin = 0;
          marginGradient = 0;
          palette = "1e1e2e;f38ba8;a6e3a1;f9e2af;89b4fa;f5c2e7;94e2d5;cdd6f4";
          brightPalette = "585b70;f38ba8;a6e3a1;f9e2af;89b4fa;f5c2e7;94e2d5;cdd6f4";
          foreground = "cdd6f4";
          brightForeground = "cdd6f4";
        };
      };
    };

    boot.loader.efi.canTouchEfiVariables = true;

    environment.systemPackages = [
      pkgs.sbctl
    ];
  };

}
