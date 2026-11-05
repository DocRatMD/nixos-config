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
        { id = "ghmbeldphafepmbegfdlkpapadhbakde"; } # ProtonPass
        { id = "danncghahncanipdoajmakdbeaophenb"; } # Auto-Group Tabs
        { id = "mnjggcdmjocbbbhaepdhchncahnbgone"; } # SponsorBlock
        { id = "hfkjahglikjilgkjofapdkdboikoobfg"; } # YouTube No Scroll For Details
      ];

      commandLineArgs = [
        "--ozone-platform-hint=auto"
      ];
    };
  };

}
