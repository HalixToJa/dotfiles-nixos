# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./packages.nix
    ./modules/bundle.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_cachyos-lts.cachyOverride {mArch = "ZEN4";};

  services.scx = {
    enable = true;
    scheduler = "scx_lavd";
    extraArgs = [
      "--autopilot";
    ];
    package = pkgs.scx-full_git;
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];

  security.polkit.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    package = pkgs.mesa_git;
    package32 = pkgs.mesa32_git;
  };

  systemd.services.NetworkManager-wait-online.enable = false;

  services.xserver.videoDrivers = ["amdgpu"];

  networking.hostName = "zenbook";

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Warsaw";

  i18n.defaultLocale = "pl_PL.UTF-8";

  system.stateVersion = "25.05";
}
