{ self, inputs, ... }: {

  flake.nixosModules.gnome = { ... }: {
    home-manager.sharedModules = [ self.homeModules.gnome ];
    services.desktopManager.gnome.enable = true;
  };

  flake.homeModules.gnome = { pkgs, lib, ... }: {
    programs.gnome-shell = {
      enable = true;

      extensions = [
        { package = pkgs.gnomeExtensions.blur-my-shell; }
        { package = pkgs.gnomeExtensions.arcmenu; }
      ];
    };

    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        clock-format = "12h";
        clock-show-weekday = true;
      };

      "org/gnome/desktop/session" = {
        idle-delay = lib.hm.gvariant.mkUint32 0;
      };

      "org/gnome/shell" = {
        favorite-apps = [
          "firefox.desktop"
          "org.gnome.Nautilus.desktop"
          "org.gnome.Console.desktop"
          "steam.desktop"
        ];
      };
    };
  };

}
