{ pkgs, config, ... }: {
  programs = {
    rog-control-center = {
      enable = false;
      autoStart = false;
    };
  };
  services = {
    asusd = {
      enable = true;
      enableUserService = true;
    };
    #auto-epp = {
    #  enable = true;
    #  settings.Settings = {
    #    epp_state_for_BAT = "power";
    #    epp_state_for_AC = "performance";        
    #  };
    #};
  };
}
