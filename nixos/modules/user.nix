{ pkgs, ...}: {
  users.users.halix = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
}
