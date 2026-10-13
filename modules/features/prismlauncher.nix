{ self, inputs, ... }: {

  flake.nixosModules.prismlauncher = {
    home-manager.sharedModules = [ self.homeModules.prismlauncher ];
  };

  flake.homeModules.prismlauncher = { pkgs, ... }: {
    programs.prismlauncher = {
      enable = true;

      package = pkgs.prismlauncher.override {
        jdks = with pkgs; [
          jdk8
          jdk17
          jdk21
          jdk25
        ];
      };

      settings = {
        # Appearance
        ApplicationTheme = "system";
        BackgroundCat = "rory";
        IconTheme = "flat_white";
        TheCat = true;

        # Language
        Language = "en_US";
        UseSystemLocale = false;

        # Java
        AutomaticJavaSwitch = true;
        AutomaticJavaDownload = false;

        MinMemAlloc = 4096;
        MaxMemAlloc = 8192;
        EnableFeralGamemode = true;
        EnableMangohud = true;
      };
    };
  };

}
