{ self, inputs, ... }: {

  flake.nixosModules.helium = { ... }: {
    home-manager.sharedModules = [ self.homeModules.helium ];
  };

  flake.homeModules.helium = { ... }: {
    imports = [
      inputs.helium.homeModules.default
    ];

    programs.helium = {
      enable = true;

      extensions = [
        { id = "nngceckbapebfimnlniiiahkandclblb"; } # Bitwarden
        { id = "danncghahncanipdoajmakdbeaophenb"; } # Auto-Group Tabs
        { id = "mnjggcdmjocbbbhaepdhchncahnbgone"; } # SponsorBlock
        { id = "hfkjahglikjilgkjofapdkdboikoobfg"; } # YouTube No Scroll For Details
      ];

      commandLineArgs = [
        "--ozone-platform-hint=auto"
      ];
    };


    xdg.dataFile = builtins.listToAttrs (
      map
        (size: {
          name = "icons/Papirus-Dark/${size}/apps/helium.svg";
          value.source = "${inputs.assets}/icons/helium.svg";
        })
        [
          "16x16"
          "22x22"
          "24x24"
          "32x32"
          "48x48"
          "64x64"
          "96x96"
        ]
    );

  };

}
