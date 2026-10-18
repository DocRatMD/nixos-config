{ self, inputs, ... }: {

  flake.nixosModules.solaar = { ... }: {
    # home-manager.sharedModules = [ self.homeModules.solaar ];
    programs.solaar = {
      enable = true;
      userService = {
        enable = true;
        window = "hide";
      };
    };
  };

}
