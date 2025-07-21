{pkgs, ...}: {
  nixpkgs.config = {
    allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    (discord.override {withVencord = true;})
    librewolf-bin

    # cli
    fastfetch
    git
    wget
    btop
    brightnessctl
    linuxKernel.packages.linux_6_15.cpupower
    bash

    #gejming
    protonup-qt

    #kde
    kdePackages.kdeconnect-kde
    kdePackages.konsole

    #river
    river_git
    swaybg
    wofi
    waybar
    wlr-randr
    wireplumber

    #core
    home-manager
  ];

  fonts.packages = with pkgs; [
    maple-mono.truetype
    maple-mono.NF-unhinted
    maple-mono.NF-CN-unhinted
  ];
}
