_: {
  nixpkgs.overlays = [
    (final: prev: {
      xwayland = prev.xwayland.overrideAttrs (o: {
        patches = (o.patches or [ ]) ++ [
          ./patches/hidpi.patch
        ];
      });
    })
  ];
}
