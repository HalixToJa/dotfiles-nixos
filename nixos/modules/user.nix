{
  pkgs,
  ...
}:
{
  programs.zsh.enable = true;

  users.users.halix = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };
}
