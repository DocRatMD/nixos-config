{ self, inputs, ... }: {

  flake.nixosModules.ivpn = { ... }: {
    home-manager.sharedModules = [ self.homeModules.ivpn ];
    services.ivpn.enable = true;
  };

  flake.homeModules.ivpn = { pkgs, lib, ... }: {
    home.packages = with pkgs; [ ivpn-ui ];

    xdg.configFile."autostart/ivpn-ui.desktop".text = ''
      [Desktop Entry]
      Type=Application
      Name=IVPN
      Exec=${lib.getExe pkgs.ivpn-ui} --hidden
      Icon=ivpn-ui
      Terminal=false
    '';
  };

}
