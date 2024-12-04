# impure-tcc.nix
{ stdenv, wrapCC, runtimeShell, lib }:
wrapCC (stdenv.mkDerivation {
  name = "impure-tcc";
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out/bin
    cat > $out/bin/tcc <<EOF
#!${runtimeShell}
exec "${toString ./.}/tcc" "\$@"
EOF
    chmod +x $out/bin/tcc
  '';
})
