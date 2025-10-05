{ pkgs, ... }: {
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    gamescopeSession.enable = true;
    extraCompatPackages = with pkgs; [
      proton-cachyos_x86_64_v4
      steamtinkerlaunch
    ];
  };

  services.udev.packages = with pkgs; [ steamPackages.steam ];

  hardware.steam-hardware.enable = true;

  programs.gamemode.enable = true;

  programs.gamescope.package = pkgs.gamescope_git;
}
