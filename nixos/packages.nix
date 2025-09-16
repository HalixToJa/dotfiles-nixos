{pkgs, ...}: {
  nixpkgs.config = {
    allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    (discord.override {withVencord = true;})
    librewolf-bin
    strawberry
    pinta
    nicotine-plus
    zed-editor
    element-desktop
    mangohud

    # cli
    fastfetch
    git
    wget
    btop
    brightnessctl
    linuxKernel.packages.linux_6_12.cpupower
    bash
    wireplumber
    tree
    sbctl

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
