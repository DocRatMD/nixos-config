{ self, inputs, ... }: {

  flake.nixosModules.fish = { pkgs, ... }: {
    home-manager.sharedModules = [ self.homeModules.fish ];
    programs.fish = {
      enable = true;
    };
  };

  flake.homeModules.fish = { ... }: {
    programs.fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting
      '';
    };
  };

}
