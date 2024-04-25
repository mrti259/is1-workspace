{ pkgs ? import<nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    gnumake
    squeak
    poetry
    gh
  ];
  
  LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib";

  ORG = "Ingenieria-de-software-I-alumnos";
  CUATRI = "1c2024";
}
