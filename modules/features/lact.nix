{ self, inputs, ... }: {

  flake.nixosModules.lact = { ... }: {
    services.lact.enable = true;
  };

}
