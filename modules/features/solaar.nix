{ self, inputs, ... }: {

  flake.nixosModules.solaar = {
    home-manager.sharedModules = [ self.homeModules.solaar ];
    programs.solaar.enable = true;
  };

  flake.homeModules.solaar = { ... }: {
    xdg.configFile."autostart/solaar.desktop".text = ''
      [Desktop Entry]
      Type=Application
      Name=Solaar
      Exec=solaar --window=hide
    '';
  };

}
