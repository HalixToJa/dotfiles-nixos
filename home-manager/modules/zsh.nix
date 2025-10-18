{
  pkgs,
  config,
  lib,
  ...
}:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases =
      let
        flakePath = "~/nix";
      in
      {
        rebuild = "sudo nixos-rebuild switch --flake ${flakePath}";
        hms = "home-manager switch --flake ${flakePath}";
        start-river = "XDG_CURRENT_DESKTOP=river river";
      };
    initContent = "
      fastfetch
    ";
  };
}
