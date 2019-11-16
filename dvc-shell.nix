{ pkgs ? import <nixpkgs> {} }:
let
    mypkgs = import ./tf-pkgs.nix { pkgs=pkgs;} ;
in
pkgs.stdenv.mkDerivation {

     name = "dvc-shell";
     buildInputs = [ mypkgs.dvc ];

}
