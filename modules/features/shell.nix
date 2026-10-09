{ self, inputs, ... }: {

  flake.homeModules.shell = { ... }: {
    home.shellAliases = {
      ll = "ls -l";
    };
  };

}
