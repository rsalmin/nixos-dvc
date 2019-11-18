{ pkgs ? import <nixpkgs> {} }:
let
    mypkgs = import ./pkgs.nix { pkgs=pkgs;} ;
in
pkgs.stdenv.mkDerivation {

     name = "dvc-shell";
     buildInputs = [ mypkgs.dvc ];

     # prevent running dvc daemon
     shellHook = ''
         export DVC_DAEMON=1
     '';
}
