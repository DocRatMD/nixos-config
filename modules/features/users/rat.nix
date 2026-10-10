{ self, inputs, ... }: {
  flake.nixosModules.rat = { pkgs, ... }: {
    users.users.rat = {
      isNormalUser = true;
      uid = 1000;
      description = "rat";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      shell = pkgs.fish;
    };
  };
}
