{ self, inputs, ... }: {
  # This is your home.nix, your module where you configure home-manager
  # It's imported both in standalone configuration above, and in your nixos configuration
  flake.homeModules.desktop = { pkgs, config, ... }: {
    imports = [
      self.homeModules.starship
      self.homeModules.helium
      self.homeModules.kde
      self.homeModules.zed
      self.homeModules.shell
      self.homeModules.fish
      self.homeModules.solaar
      self.homeModules.git
      self.homeModules.ssh
      self.homeModules.discord
      self.homeModules.mangohud
    ];

    home.shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake 'path:${config.home.homeDirectory}/nixos-config#desktop'";
    };

    home.stateVersion = "26.05";

  };

}
