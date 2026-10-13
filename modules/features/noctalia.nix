{ self, inputs, ... }: {

  flake.nixosModules.noctalia = {
    home-manager.sharedModules = [ self.homeModules.noctalia ];
  };

  flake.homeModules.noctalia = { ... }: {
    imports = [
      inputs.noctalia.homeModules.default
    ];

    programs.noctalia = {
      enable = true;
      systemd.enable = false;
    };
  };
}
