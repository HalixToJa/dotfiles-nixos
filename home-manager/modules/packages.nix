{ pkgs, ... }: {
  home.packages = with pkgs; [
    prismlauncher
    vlc
  ];
}
