{ self, inputs, ... }: {

  flake.nixosModules.amethyst = {
    home-manager.sharedModules = [ self.homeModules.amethyst ];
  };

  flake.homeModules.amethyst = { pkgs, ... }: {
    home.packages = [
      inputs.amethyst.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
