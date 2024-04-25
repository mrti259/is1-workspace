{ pkgs ? import<nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    gnumake
    squeak
    poetry
  ];
  
  LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib";
}
