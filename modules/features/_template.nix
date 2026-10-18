{ self, inputs, ... }: {

  flake.nixosModules.NAME = { ... }: {
    #home-manager.sharedModules = [ self.homeModules.NAME ];
    # Insert stuff here
  };

  flake.homeModules.NAME = { ... }: {
    # Insert stuff here
  };

}
