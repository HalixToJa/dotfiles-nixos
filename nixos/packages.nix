{pkgs, ...}: {
  nixpkgs.config = {
    allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    (discord.override {withVencord = true;})
    librewolf-bin

    #hyprland
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk
    xorg.xrdb
    dconf

    # cli
    fastfetch
    git
    wget
    btop
    brightnessctl
    linuxKernel.packages.linux_6_15.cpupower
    bash
    wireplumber

    #gejming
    protonup-qt

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
