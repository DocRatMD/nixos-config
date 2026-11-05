{ self, inputs, ... }: {

  flake.nixosModules.proton-vpn = { ... }: {
    home-manager.sharedModules = [ self.homeModules.proton-vpn ];
  };

  flake.homeModules.proton-vpn = { pkgs, ... }: {
    home.packages = [ pkgs.proton-vpn ];

    xdg.configFile."autostart/proton-vpn.desktop".text = ''
      [Desktop Entry]
      Type=Application
      Name=Proton VPN
      Exec=${pkgs.proton-vpn}/bin/protonvpn-app --start-minimized
      Icon=proton-vpn-logo
      Terminal=false
      Categories=Network;Security;
    '';
  };

}
