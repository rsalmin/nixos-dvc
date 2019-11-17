{ pkgs ? import <nixpkgs> {} }:
let
    mypkgs = import ./pkgs.nix { pkgs=pkgs;} ;
in
pkgs.stdenv.mkDerivation {

     name = "tensorflow-shell";
     buildInputs = [ mypkgs.tensorflowWithCuda ];

}
