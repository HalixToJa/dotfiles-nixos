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

  boot.kernelPackages = pkgs.linuxPackages_cachyos.cachyOverride {mArch = "ZEN4";};

  nix.settings.experimental-features = ["nix-command" "flakes"];

  security.polkit.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = ["amdgpu"];

  networking.hostName = "zenbook";

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Warsaw";

  i18n.defaultLocale = "pl_PL.UTF-8";

  system.stateVersion = "25.05";
}
