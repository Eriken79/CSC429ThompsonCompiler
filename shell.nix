with import <nixpkgs> {};

pkgs.mkShell {
  nativeBuildInputs = [
    (callPackage ./impure-tcc.nix {})
  ];
  shellHook = ''
    export C_INCLUDE_PATH=${lib.getDev stdenv.cc.libc}/include
  '';
}
