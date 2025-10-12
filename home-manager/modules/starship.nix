{ lib, ... }: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
  xdg.configFile."starship.toml".source  = ./bracketed-segments.toml;
}
