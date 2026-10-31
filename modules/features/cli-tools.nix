{ self, inputs, ... }: {

  flake.nixosModules.cli-tools = { pkgs, ... }: {
    home-manager.sharedModules = [ self.homeModules.cli-tools ];

    #     programs.nix-ld = {
    #       enable = true;
    #
    #       libraries = with pkgs; [
    #         libxkbcommon
    #         wayland
    #         vulkan-loader
    #         fontconfig
    #         freetype
    #         alsa-lib
    #         openssl
    #         libx11
    #         libxcb
    #         libxcursor
    #         libxrandr
    #         libxi
    #       ];
    #     };

  };

  flake.homeModules.cli-tools = { pkgs, ... }: {
    home.packages = with pkgs; [
      #Search and inspection
      ripgrep
      fd
      bat
      jq

      #System utilities
      btop
      dust
      tree
      fastfetch
      micro
      unrar
      android-tools

      #NixOS
      nix-tree
    ];
  };
}
