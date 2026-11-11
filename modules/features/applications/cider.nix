{ self, inputs, ... }: {

  flake.nixosModules.cider = { ... }: {
    home-manager.sharedModules = [ self.homeModules.cider ];
  };

  flake.homeModules.cider = { pkgs, ... }: {
    imports = [
      inputs.cider.homeManagerModules.default
    ];
    programs.cider.enable = true;
  };

}
