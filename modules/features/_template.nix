{ self, inputs, ... }: {

  flake.nixosModules.NAME = { ... }: {
    home-manager.sharedModules = [ self.homeModules.NAME ];
    # Insert stuff here
  };

  flake.homeModules.NAME = { pkgs, ... }: {
    #home.packages = with pkgs; [ NAME ];
    # Insert stuff here
  };

}
