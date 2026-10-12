{ self, inputs, ... }: {
  flake.homeModules.amethyst = { pkgs, ... }: {
    home.packages = [
      inputs.amethyst.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
