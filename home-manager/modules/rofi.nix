_: {
  programs.rofi = {
    enable = true;
    extraConfig = {
      drun-run-command = "uwsm app -- {cmd}";
      drun-match-fields = "name,generic,exec,categories,keywords";
    };
  };
}
