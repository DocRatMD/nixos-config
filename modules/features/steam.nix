{ self, inputs, ... }: {

  flake.nixosModules.steam = { pkgs, ... }: {
    programs.steam = {
      enable = true;
      extraCompatPackages = [
        pkgs.proton-ge-bin
      ];
      package = pkgs.steam.override {
        extraEnv = {
          MANGOHUD = true;
        };
      };
    };
    environment.etc."xdg/autostart/steam.desktop".text = ''
      [Desktop Entry]
      Type=Application
      Name=Steam
      Exec=steam -silent
      Icon=steam
    '';
  };

}
