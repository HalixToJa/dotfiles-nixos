_: {
  programs.rofi = {
    enable = true;
    font = "Maple Mono 12";
    terminal = "kitty";
    extraConfig = {
      drun-run-command = "uwsm app -- {cmd}";
      drun-match-fields = "name,generic,exec,categories,keywords";
    };
  };
}
