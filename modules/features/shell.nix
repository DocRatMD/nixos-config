{ self, inputs, ... }: {

  flake.nixosModules.shell = { ... }: {
    home-manager.sharedModules = [ self.homeModules.shell ];
  };

  flake.homeModules.shell = { config, ... }:
    let
      flake = "path:${config.home.homeDirectory}/nixos-config";
    in
    {
      home.shellAliases = {
        ll = "ls -l";
        rebuild = "nixos-rebuild switch --sudo --flake '${flake}'";
        testbuild = "nixos-rebuild test --sudo --flake '${flake}'";
        assets = "nix flake update assets --flake '${flake}'";
      };
    };

}
