{ self, inputs, ... }: {

  flake.homeModules.ssh = { ... }: {
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;

      settings = {
        "github.com" = {
          User = "git";
          IdentityFile = "~/.ssh/github_ed25519";
          IdentitiesOnly = true;
          AddKeysToAgent = "yes";
        };
      };
    };

    services.ssh-agent.enable = true;
  };

}
