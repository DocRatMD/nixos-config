{ self, inputs, ... }: {

  flake.nixosModules.heroic = { ... }: {
    home-manager.sharedModules = [ self.homeModules.heroic ];
  };

  flake.homeModules.heroic = { pkgs, ... }: {
    home.packages = with pkgs; [ heroic ];
  };

}
