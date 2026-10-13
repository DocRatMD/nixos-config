{ self, inputs, ... }: {
  flake.nixosModules.starship = {
    home-manager.sharedModules = [ self.homeModules.starship ];
  };

  flake.homeModules.starship = {
    programs.starship = {
      enable = true;
      settings = {
        add_newline = false;
        character = {
          success_symbol = "[❯](bold green)";
          error_symbol = "[❯](bold red)";
        };
      };
    };
  };

}
