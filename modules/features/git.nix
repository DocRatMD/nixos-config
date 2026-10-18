{ self, inputs, ... }: {

  flake.nixosModules.git = { ... }: {
    home-manager.sharedModules = [ self.homeModules.git ];
  };

  flake.homeModules.git = { ... }: {
    programs.git = {
      enable = true;

      settings = {
        user = {
          name = "rat";
          email = "47792236+DocRatMD@users.noreply.github.com";
          useConfigOnly = true;
        };

        init.defaultBranch = "main";
        pull.ff = "only";
      };
    };
  };

}
