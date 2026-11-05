{ self, inputs, ... }: {

  flake.nixosModules.desktop-kde = { ... }: {
    home-manager.sharedModules = [ self.homeModules.desktop-kde ];
  };

  flake.homeModules.desktop-kde = { pkgs, ... }: {

    programs.plasma = {
      input.mice = [
        {
          name = "Logitech PRO X 2";
          vendorId = "046d";
          productId = "40a9";
          accelerationProfile = "none";
          acceleration = 0.0;
        }
        {
          name = "Logitech PRO X 2";
          vendorId = "046d";
          productId = "c09b";
          accelerationProfile = "none";
          acceleration = 0.0;
        }
      ];

      powerdevil = {
        AC = {
          autoSuspend.action = "nothing";
          dimDisplay.enable = false;
          powerProfile = "performance";
          turnOffDisplay = {
            idleTimeout = "never";
          };
        };
      };
    };
  };

}
