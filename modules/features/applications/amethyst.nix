{ self, inputs, pkgs, ... }: {

  flake.nixosModules.amethyst = { ... }: {
    home-manager.sharedModules = [ self.homeModules.amethyst ];
  };

  flake.homeModules.amethyst = { pkgs, ... }:
    let
      amethyst = inputs.amethyst.packages.${pkgs.stdenv.hostPlatform.system}.default;
    in
    {
      home.packages = [ amethyst ];
      xdg.desktopEntries."io.github.Amethyst.ModManager" = {
        name = "Amethyst Mod Manager";
        exec = "${pkgs.coreutils}/bin/env AMM_STEAM_OVERLAY=0 ${amethyst}/bin/amethyst-mod-manager %u";
        icon = "io.github.Amethyst.ModManager";
        categories = [ "Game" "Utility" ];
        terminal = false;
        settings.StartupWMClass = "amethyst-mod-manager";
      };
    };

}
