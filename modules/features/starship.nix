{ self, inputs, ... }: {
  flake.nixosModules.starship = { ... }: {
    home-manager.sharedModules = [ self.homeModules.starship ];
  };

  flake.homeModules.starship = { ... }: {
    programs.starship = {
      enable = true;
      enableFishIntegration = true;
      enableTransience = true;

      settings = {
        format = "$os\${custom.directory_icon}$directory$git_branch$git_status$character";

        custom.directory_icon = {
          when = true;
          shell = [ "sh" ];

          command = ''
            if [ ! -w . ]; then
              printf ''
            elif [ "$PWD" = "$HOME" ]; then
              printf ''
            else
              printf ''
            fi
          '';

          format = "[$output ]($style)";
          style = "bold #8CA9BD";
        };

        os = {
          disabled = false;
          format = "[$symbol]($style)";
          style = "bold white";
          symbols.NixOS = " ";
        };

        directory = {
          format = "[$path]($style) ";
          style = "bold #8CA9BD";
          truncation_length = 3;
          truncate_to_repo = true;
        };

        git_branch = {
          format = "[$symbol$branch]($style) ";
          symbol = " ";
          style = "bold #7995AC";
        };

        git_status = {
          format = "([$all_status$ahead_behind]($style) )";
          style = "bold #7faeb8";
        };

        #add_newline = false;
        character = {
          success_symbol = "[❮](bold #31748f) ";
          error_symbol = "[❮](bold #31748f) ";
        };
      };
    };
  };

}
