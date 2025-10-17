final: prev:

{
  linux-firmware = prev.linux-firmware.overrideAttrs (old: {
    version = "20250808";
    src = prev.fetchurl {
      url = "https://kernel.org/pub/linux/kernel/firmware/linux-firmware-20250808.tar.gz";
      sha256 = "sha256-1/HW8nLanyzKQIaXSYVSflCH+a7QMK0d5ilpE3TbejA=";
    };
  });
}
