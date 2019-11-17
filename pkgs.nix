{ pkgs ? import <nixpkgs> {} }:
rec {
    keras-applications = pkgs.callPackage ./tf/keras-applications.nix {
        inherit (pkgs.python37Packages) buildPythonPackage fetchPypi numpy h5py;
    };
    tensorflow-estimator = pkgs.callPackage ./tf/tensorflow-estimator.nix {
        inherit (pkgs.python37Packages) buildPythonPackage fetchPypi numpy absl-py mock;
    };
    tensorflow = pkgs.callPackage ./tf/tensorflow.nix {
        python = pkgs.python37;
        inherit (pkgs.python37.passthru) isPy3k pythonAtLeast pythonOlder;
        inherit (pkgs.linuxPackages) nvidia_x11;
        inherit (pkgs.python37Packages) buildPythonPackage numpy tensorflow-tensorboard backports_weakref mock enum34 absl-py future setuptools wheel keras-preprocessing google-pasta functools32 opt-einsum termcolor grpcio six wrapt cython astor gast;
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
    tensorflowWithCuda = pkgs.callPackage ./tf/tensorflow.nix {
        python = pkgs.python37;
        inherit (pkgs.python37.passthru) isPy3k pythonAtLeast pythonOlder;
        inherit (pkgs.linuxPackages) nvidia_x11;
        inherit (pkgs.python37Packages) buildPythonPackage numpy tensorflow-tensorboard backports_weakref mock enum34 absl-py future setuptools wheel keras-preprocessing google-pasta functools32 opt-einsum termcolor grpcio six wrapt cython astor gast;
        keras-applications = keras-applications;
        tensorflow-estimator = tensorflow-estimator;
        cudatoolkit = pkgs.cudatoolkit_10;
        cudnn = pkgs.cudnn_cudatoolkit_10;
        nccl = pkgs.nccl_cudatoolkit_10;
        openssl = pkgs.openssl_1_0_2;

        cudaSupport = true;
        sse42Support = true;
        avx2Support = true;
        fmaSupport = true;
    };
    promise = pkgs.callPackage ./tf-datasets/promise.nix {
          inherit (pkgs.python37Packages) buildPythonPackage fetchPypi six;
    };
    tensorflow-metadata = pkgs.callPackage ./tf-datasets/tensorflow-metadata.nix {
          inherit (pkgs.python37Packages) buildPythonPackage fetchPypi googleapis_common_protos;
    };
    tensorflow-datasets = pkgs.callPackage ./tf-datasets/tensorflow-datasets.nix {
          inherit (pkgs.python37Packages) buildPythonPackage fetchPypi protobuf requests dill
                                                                   absl-py future termcolor tqdm attrs numpy wrapt
                                                                   googleapis_common_protos;
          promise = promise;
          tensorflow-metadata = tensorflow-metadata;
    };
    gitdb2 = pkgs.callPackage ./dvc/gitdb2.nix {
          inherit (pkgs.python37Packages) buildPythonPackage fetchPypi smmap2;
     };
     tqdm = pkgs.callPackage ./dvc/tqdm.nix {
          inherit (pkgs.python37Packages) buildPythonPackage fetchPypi nose coverage flake8;
          glibcLocales = pkgs.glibcLocales;
     };
     ruamel_yaml_clib = pkgs.callPackage ./dvc/ruamel_yaml_clib.nix {
           inherit (pkgs.python37Packages) buildPythonPackage fetchPypi ruamel_base ruamel_ordereddict;
           isPy3k = true;
     };
     ruamel_yaml = pkgs.callPackage ./dvc/ruamel_yaml.nix {
          inherit (pkgs.python37Packages) buildPythonPackage fetchPypi ruamel_base ruamel_ordereddict;
          isPy3k = true;
          ruamel_yaml_clib = ruamel_yaml_clib;
     };
     treelib = pkgs.callPackage ./dvc/treelib.nix {
          inherit (pkgs.python37Packages) buildPythonPackage fetchPypi;
     };
     jsonpath_ng = pkgs.callPackage ./dvc/jsonpath_ng.nix {
          inherit (pkgs.python37Packages) buildPythonPackage fetchPypi decorator six ply;
          treelib = treelib;
     };
     pathspec = pkgs.callPackage ./dvc/pathspec.nix {
          inherit (pkgs.python37Packages) buildPythonPackage fetchPypi;
     };
     dvc = pkgs.callPackage ./dvc/dvc.nix {
          inherit (pkgs.python37Packages) buildPythonPackage fetchPypi humanize configobj networkx
                                                                   distro flufl_lock shortuuid funcy packaging future ply pyasn1
                                                                   colorama asciimatics requests inflect grandalf schema nanotime
                                                                   configparser appdirs;
          GitPython = pkgs.python37Packages.GitPython.override{ gitdb2 = gitdb2; };
          tqdm = tqdm;
          gitdb2 = gitdb2;
          ruamel_yaml = ruamel_yaml;
          jsonpath_ng = jsonpath_ng;
          pathspec = pathspec;
    };
}
