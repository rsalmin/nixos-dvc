{ pkgs ? import <nixpkgs> {} }:
let
    promise = pkgs.callPackage ./tf-datasets/promise.nix {
          buildPythonPackage = pkgs.python37Packages.buildPythonPackage;
          fetchPypi = pkgs.python37Packages.fetchPypi;
          six = pkgs.python37Packages.six;
     };
     tensorflow-metadata = pkgs.callPackage ./tf-datasets/tensorflow-metadata.nix {
          buildPythonPackage = pkgs.python37Packages.buildPythonPackage;
          fetchPypi = pkgs.python37Packages.fetchPypi;
          googleapis-common-protos = pkgs.python37Packages.googleapis_common_protos;
     };
     tensorflow-datasets = pkgs.callPackage ./tf-datasets/tensorflow-datasets.nix {
          buildPythonPackage = pkgs.python37Packages.buildPythonPackage;
          fetchPypi = pkgs.python37Packages.fetchPypi;
          protobuf = pkgs.python37Packages.protobuf;
          requests = pkgs.python37Packages.requests;
          dill = pkgs.python37Packages.dill;
          promise = promise;
          absl-py = pkgs.python37Packages.absl-py;
          future = pkgs.python37Packages.future;
          tensorflow-metadata = tensorflow-metadata;
          termcolor = pkgs.python37Packages.termcolor;
          tqdm = pkgs.python37Packages.tqdm;
          attrs = pkgs.python37Packages.attrs;
          numpy = pkgs.python37Packages.numpy;
          wrapt = pkgs.python37Packages.wrapt;
          googleapis-common-protos = pkgs.python37Packages.googleapis_common_protos;
     };
in
   pkgs.stdenv.mkDerivation {

     name = "test-shell";
     buildInputs = with pkgs;
                  [
                    tensorflow-datasets
                  ];
}
