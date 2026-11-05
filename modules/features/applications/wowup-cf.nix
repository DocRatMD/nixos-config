{ self, inputs, ... }: {

  flake.nixosModules.wowup-cf = { ... }: {
    home-manager.sharedModules = [ self.homeModules.wowup-cf ];
  };

  flake.homeModules.wowup-cf = { pkgs, ... }: {
    home.packages = with pkgs; [ wowup-cf ];
  };

}
