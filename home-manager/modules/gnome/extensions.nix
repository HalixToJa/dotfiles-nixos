{ pkgs, ...}: {
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;

      #enabled-extensions = [
      #];
    };
  };
  home.packages = with pkgs; [
    gnomeExtensions.blur-my-shell
    gnomeExtensions.just-perfection
    gnomeExtensions.quick-settings-audio-panel
    gnomeExtensions.media-controls
  ];
}
