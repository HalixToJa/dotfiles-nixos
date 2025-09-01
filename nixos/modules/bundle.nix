{
  imports = [
    ./bootloader.nix
    ./user.nix
    ./bluetooth.nix
    ./steam.nix
    ./asusctl.nix
    ./pipewire.nix
    ./gnome.nix
    ./spicetify.nix
    ./firewall.nix
    ./wlroots/wlroots.nix
    ./xwayland/xwayland.nix
    #./slskd.nix
  ];
}
