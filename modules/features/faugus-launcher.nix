{ self, inputs, ... }: {

  flake.nixosModules.faugus-launcher = { ... }: {
    home-manager.sharedModules = [ self.homeModules.faugus-launcher ];
  };

  flake.homeModules.faugus-launcher = { pkgs, ... }: {
    home.packages = with pkgs; [ faugus-launcher ];
  };

}
