{
  pkgs,
  ...
}:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    gamescopeSession.enable = true;
    extraCompatPackages = with pkgs; [
      nur.repos.forkprince.proton-cachyos-v4-bin
      steamtinkerlaunch
    ];
  };

  hardware.steam-hardware.enable = true;

  programs.gamemode.enable = true;
}
