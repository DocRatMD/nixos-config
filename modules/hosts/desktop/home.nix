{ self, inputs, ... }: {

  flake.homeModules.desktop = { pkgs, config, ... }:
    let
      flake = "path:${config.home.homeDirectory}/nixos-config";
    in
    {
      imports = [
        # I use sharedModules so all imports are done in configuration.nix
      ];

      home.shellAliases = {
        rebuild = "nix flake update assets --flake '${flake}'; nixos-rebuild switch --sudo --flake '${flake}#desktop'";
      };

      home.stateVersion = "26.05";
    };

}
