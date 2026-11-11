{ self, inputs, ... }: {

  flake.nixosModules.xivlauncher = { ... }: {
    home-manager.sharedModules = [ self.homeModules.xivlauncher ];
  };

  flake.homeModules.xivlauncher = { pkgs, ... }: {
    home.packages = with pkgs; [ xivlauncher ];
  };

}
