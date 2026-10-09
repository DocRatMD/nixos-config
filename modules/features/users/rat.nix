{ self, inputs, ... }: {
  flake.nixosModules.rat = { ... }: {
    users.users.rat = {
      isNormalUser = true;
      uid = 1000;
      description = "rat";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };
  };
}
