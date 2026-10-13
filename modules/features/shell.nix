{ self, inputs, ... }: {

  flake.nixosModules.shell = {
    home-manager.sharedModules = [ self.homeModules.shell ];
  };

  flake.homeModules.shell = { ... }: {
    home.shellAliases = {
      ll = "ls -l";
    };
  };

}
