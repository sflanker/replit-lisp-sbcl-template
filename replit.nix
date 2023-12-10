{ pkgs }: {
    deps = [
      pkgs.bind.dnsutils
      pkgs.nettools
      pkgs.netcat-gnu
      pkgs.sbcl
    ];
}