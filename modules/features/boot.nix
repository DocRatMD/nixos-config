{ self, inputs, ... }: {

  flake.nixosModules.boot = { pkgs, ... }: {
    boot.loader.limine = {
      enable = true;
      maxGenerations = 5;

      # Leave this false for the first install, then set it to true
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

      # extraConfig = ''
      #   remember_last_entry: yes
      # '';

      extraEntries = ''
        /Windows
          protocol: efi
          path: uuid(45b33acb-62b0-4116-a869-cfe10a6325c6):/EFI/Microsoft/Boot/bootmgfw.efi
      '';
    };

    boot.loader.efi.canTouchEfiVariables = true;

    environment.systemPackages = [
      pkgs.sbctl
    ];

    boot.kernelParams = [
      "reboot=pci" #For NVIDIA GPU
    ];
  };

}
