{
  pkgs,
  ...
}:
{
  nixpkgs.config = {
    allowUnfree = true;
  };

  programs.nix-ld.enable = true;

  environment.systemPackages = with pkgs; [
    (discord.override { withVencord = true; })
    librewolf-bin
    strawberry
    pinta
    nicotine-plus
    zed-editor
    element-desktop
    mangohud
    vlc
    prismlauncher
    wine
    nil
    xorg.xprop
    xorg.xrdb
    dpms-off
    inxi
    zig
    zls
    picard

    uv

    # cli
    fastfetch
    git
    wget
    btop
    s-tui
    cmatrix
    brightnessctl
    linuxKernel.packages.linux_6_17.cpupower
    bash
    wireplumber
    tree
    sbctl
    usbutils
    pciutils
    glib
    unzip

    #core
    home-manager
  ];

  fonts.packages = with pkgs; [
    maple-mono.truetype
    maple-mono.NF-unhinted
    maple-mono.NF-CN-unhinted
    noto-fonts-color-emoji
    noto-fonts-cjk-sans
    noto-fonts
    dm-mono
  ];
}
