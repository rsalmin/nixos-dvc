{ pkgs ? import <nixpkgs> {} }:
let
     keras-applications = pkgs.callPackage ./tf/keras-applications.nix {
        buildPythonPackage = pkgs.python37Packages.buildPythonPackage;
        inherit (pkgs.python37Packages) fetchPypi numpy h5py;
     };
     tensorflow-estimator = pkgs.callPackage ./tf/tensorflow-estimator.nix {
        buildPythonPackage = pkgs.python37Packages.buildPythonPackage;
        inherit (pkgs.python37Packages) fetchPypi numpy absl-py mock;
     };
     tensorflow = pkgs.callPackage ./tf/tensorflow.nix {
        python = pkgs.python37;
        buildPythonPackage = pkgs.python37Packages.buildPythonPackage;
        inherit (pkgs.python37.passthru) isPy3k pythonAtLeast pythonOlder;
        inherit (pkgs.linuxPackages) nvidia_x11;
        inherit (pkgs.python37Packages) numpy tensorflow-tensorboard backports_weakref mock enum34 absl-py future setuptools wheel keras-preprocessing google-pasta functools32 opt-einsum termcolor grpcio six wrapt cython astor gast;
        keras-applications = keras-applications;
        tensorflow-estimator = tensorflow-estimator;
        cudatoolkit = pkgs.cudatoolkit_10;
        cudnn = pkgs.cudnn_cudatoolkit_10;
        nccl = pkgs.nccl_cudatoolkit_10;
        openssl = pkgs.openssl_1_0_2;

        cudaSupport = false;
        sse42Support = true;
        avx2Support = true;
        fmaSupport = true;
  };
in
   pkgs.stdenv.mkDerivation {

     name = "tensorflow-shell";
     buildInputs = with pkgs;
                  [
                    tensorflow
                  ];
}
