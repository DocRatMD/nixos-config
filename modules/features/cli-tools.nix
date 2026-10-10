{ self, inputs, ... }: {
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

      #NixOS
      nix-tree
    ];
  };
}
