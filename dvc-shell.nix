{ pkgs ? import <nixpkgs> {} }:
let
    mypkgs = import ./pkgs.nix { pkgs=pkgs;} ;
in
pkgs.stdenv.mkDerivation {

     name = "dvc-shell";
     buildInputs = [ mypkgs.dvc ];

}
