{ pkgs, ... }: {
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  environment.gnome = {
    excludePackages = (with pkgs; [
      atomix
      geary
      gedit
      epiphany
      gnome-tour
      gnome-terminal
      gnome-music
    ]);
  };
  services.desktopManager.gnome.extraGSettingsOverrides = ''
    [org.gnome.mutter]
    experimental-features=['variable-refresh-rate']
  '';
}
