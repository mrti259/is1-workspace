{ pkgs ? import<nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    gnumake
    squeak
    gh
    nodejs
    poetry
    python311
    python311Packages.flask
  ];
  
  LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib";

  ORG = "Ingenieria-de-software-I-alumnos";
  CUATRI = "2c2024";
}
