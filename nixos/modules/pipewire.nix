_: {
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    extraConfig = {
      pipewire."92-low-latency" = {
        "context.properties" = {
          "default.clock.rate" = 44100;
          "default.clock.quantum" = 512;
          "default.clock.min-quantum" = 512;
          "default.clock.max-quantum" = 512;
        };
      };
      pipewire-pulse."92-low-latency" = {
        context.modules = [
          {
            name = "libpipewire-module-protocol-pulse";
            args = {
              pulse.min.req = "512/44100";
              pulse.default.req = "512/44100";
              pulse.max.req = "512/44100";
              pulse.min.quantum = "512/44100";
              pulse.max.quantum = "512/44100";
            };
          }
        ];
        stream.properties = {
          node.latency = "512/44100";
          resample.quality = 1;
        };
      };
    };
  };
}
