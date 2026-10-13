{ self, inputs, ... }: {

  flake.nixosModules.discord = {
    home-manager.sharedModules = [ self.homeModules.discord ];
  };

  flake.homeModules.discord = { pkgs, ... }: {
    programs.vesktop = {
      enable = true;

      vencord.settings = {
        plugins = {
          FakeNitro.enabled = true;
        };
      };

      settings = {
        customTitleBar = true;
        tray = true;
        minimizeToTray = true;
      };
    };
  };

}
