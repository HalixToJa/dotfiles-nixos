{ pkgs, ... }: {
  programs.helix = {
    enable = true;
    settings = {
      theme = "autumn";
      editor.cursor-shape = {
        normal = "bar";
        insert = "bar";
        select = "underline";
      };
    };
    languages.language = [{
      name = "nix";
      auto-format = true;
      formatter.command = pkgs.nixfmt-rfc-style;
    }];
  };
}
