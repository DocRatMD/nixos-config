{ self, inputs, ... }: {

  flake.nixosModules.motrix = { ... }: {
    home-manager.sharedModules = [ self.homeModules.motrix ];
  };

  flake.homeModules.motrix = { pkgs, ... }: {
    home.packages = with pkgs; [ motrix ];
  };

}
