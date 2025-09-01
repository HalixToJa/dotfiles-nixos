_: {
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 2234 ];
    allowedUDPPorts = [ 2234 ];
  };
}
