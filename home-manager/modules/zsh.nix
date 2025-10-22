_: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    profileExtra = ''
      if uwsm check may-start && uwsm select; then
        exec uwsm start default
      fi
    '';

    shellAliases =
      let
        flakePath = "~/nix";
      in
      {
        rebuild = "nh os switch ${flakePath}";
        hms = "nh home switch ${flakePath}";
        start-river = "XDG_CURRENT_DESKTOP=river river";
      };
    initContent = "
      fastfetch
    ";
  };
}
