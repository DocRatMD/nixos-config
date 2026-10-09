{ self, inputs, ... }:
{
  flake.homeModules.zed = { pkgs, ... }: {
    home.packages = [
      pkgs.nixpkgs-fmt
    ];

    programs.zed-editor = {
      enable = true;

      extensions = [
        "nix"
      ];

      userSettings = {
        theme = "Ayu Dark";
        project_panel = {
          dock = "left";
          starts_open = true;
        };
        languages = {
          Nix = {
            tab_size = 2;
            hard_tabs = false;
            format_on_save = "on";
            formatter = {
              external = {
                command = "nixpkgs-fmt";
              };
            };
            language_servers = [
              "!nil"
            ];
          };
        };
      };
    };
  };

}
