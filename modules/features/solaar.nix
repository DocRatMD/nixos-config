{ self, inputs, ... }: {
  flake.nixosModules.solaar = {
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
