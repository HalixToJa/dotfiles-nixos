{ pkgs, ...}: {
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
    river
    swaybg
    wofi
    waybar
    
    #core
    home-manager

    twemoji-color-font
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-color-emoji
    noto-fonts-lgc-plus
    noto-fonts-cjk-sans
    fira-code
    fira-code-symbols
    twemoji-color-font
  ];
}
