with import <nixpkgs> {};
pkgs.mkShell {
  nativeBuildInputs = [
   cmake
   (callPackage ./impure-clang.nix {})
  ];
}
