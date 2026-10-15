{ self, inputs, ... }: {

  flake.nixosModules.shell = {
    home-manager.sharedModules = [ self.homeModules.shell ];
  };

  flake.homeModules.shell = { config, ... }:
    let
      flake = "path:${config.home.homeDirectory}/nixos-config";
    in
    {
      home.shellAliases = {
        ll = "ls -l";
        rebuild = "nix flake update assets --flake '${flake}'; nixos-rebuild switch --sudo --flake '${flake}'";
      };
    };

}
