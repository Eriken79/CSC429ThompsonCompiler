with import <nixpkgs> {};

# ugh...
# ./configure --crtprefix=/nix/store/wn7v2vhyyyi6clcyn0s9ixvl7d4d87ic-glibc-2.40-36/lib
#             --elfinterp=/nix/store/wn7v2vhyyyi6clcyn0s9ixvl7d4d87ic-glibc-2.40-36/lib64/ld-linux-x86-64.so.2

pkgs.mkShell {
  nativeBuildInputs = [
    (callPackage ./impure-tcc.nix {})
  ];
  shellHook = ''
    export C_INCLUDE_PATH=${./include}:${lib.getDev stdenv.cc.libc}/include
    export LIBRARY_PATH=${./.}:${lib.getLib stdenv.cc.libc}/lib
    echo "./configure --crtprefix=${lib.getLib stdenv.cc.libc}/lib --elfinterp=${lib.getLib stdenv.cc.libc}/lib64/ld-linux-x86-64.so.2"
  '';
}
