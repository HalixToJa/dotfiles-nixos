_: {
  programs.rofi = {
    enable = true;
    extraConfig = {
      drun-match-fields = "name,generic,exec,categories,keywords";
    };
  };
}
