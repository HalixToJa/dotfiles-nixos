{pkgs, ...}: {
  nixpkgs.config = {
    allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    (discord.override {withVencord = true;})
    librewolf-bin
    gnome-tweaks
    strawberry
    tagger

    #gnome
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-gnome
    catppuccin-cursors.mochaDark
    nordic
    adwaita-qt
    gnome-themes-extra
    

    #hyprland
    xdg-desktop-portal-hyprland
    xorg.xrdb
    dconf

    # cli
    fastfetch
    git
    wget
    btop
    brightnessctl
    linuxKernel.packages.linux_6_16.cpupower
    bash
    wireplumber
    
    #core
    home-manager
  ];

  fonts.packages = with pkgs; [
    maple-mono.truetype
    maple-mono.NF-unhinted
    maple-mono.NF-CN-unhinted
    noto-fonts-emoji
    noto-fonts-cjk-sans
    noto-fonts
    dm-mono
  ];
}
