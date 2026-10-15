{ self, inputs, ... }: {
  flake.nixosConfigurations.nixos-desktop = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.desktopConfiguration
      self.nixosModules.myHomeManager
    ];
  };

}
