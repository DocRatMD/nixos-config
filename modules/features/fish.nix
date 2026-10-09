{ self, inputs, ... }: {

  flake.nixosModules.fish = { pkgs, ... }: {
    programs.fish = {
      enable = true;
    };
    users.defaultUserShell = pkgs.fish;
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
