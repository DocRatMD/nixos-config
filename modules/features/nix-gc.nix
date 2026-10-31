{ self, inputs, ... }: {

  flake.nixosModules.nix-gc = { ... }: {
    # Nix garbage collection - Do a weekly deletion of generations older than 30 days
    nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

}
