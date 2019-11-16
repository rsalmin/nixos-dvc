{ pkgs ? import <nixpkgs> {} }:
let
    mypkgs = import ./tf-pkgs.nix { pkgs=pkgs;} ;
in
pkgs.stdenv.mkDerivation {

     name = "tensorflow-datasets-shell";
     buildInputs = [ mypkgs.tensorflow-datasets ];

}
