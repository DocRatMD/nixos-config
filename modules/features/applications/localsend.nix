{ self, inputs, ... }: {

  flake.nixosModules.localsend = { ... }: {
    home-manager.sharedModules = [ self.homeModules.localsend ];
  };

  flake.homeModules.localsend = { pkgs, ... }: {
    home.packages = with pkgs; [ localsend ];
  };

}
