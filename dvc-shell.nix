{ pkgs ? import <nixpkgs> {} }:
let
     gitdb2 = pkgs.callPackage ./gitdb2.nix {
          buildPythonPackage = pkgs.python37Packages.buildPythonPackage;
          fetchPypi = pkgs.python37Packages.fetchPypi;
          smmap2 = pkgs.python37Packages.smmap2;
     };     
     funcy = pkgs.callPackage ./funcy.nix {
          buildPythonPackage = pkgs.python37Packages.buildPythonPackage;
          fetchPypi = pkgs.python37Packages.fetchPypi;
     };     
     atpublic = pkgs.callPackage ./atpublic.nix {
          buildPythonPackage = pkgs.python37Packages.buildPythonPackage;
          fetchPypi = pkgs.python37Packages.fetchPypi;
     };
     tqdm = pkgs.callPackage ./tqdm.nix {
          buildPythonPackage = pkgs.python37Packages.buildPythonPackage;
          fetchPypi = pkgs.python37Packages.fetchPypi;
          nose = pkgs.python37Packages.nose;
          coverage = pkgs.python37Packages.coverage;
          glibcLocales = pkgs.glibcLocales;
          flake8  = pkgs.python37Packages.flake8;
     };
     flufl_lock = pkgs.callPackage ./flufl.lock.nix {
          buildPythonPackage = pkgs.python37Packages.buildPythonPackage;
          fetchPypi = pkgs.python37Packages.fetchPypi;
          atpublic = atpublic;
     };
     ruamel_yaml_clib = pkgs.callPackage ./ruamel_yaml_clib.nix {
          buildPythonPackage = pkgs.python37Packages.buildPythonPackage;
          fetchPypi = pkgs.python37Packages.fetchPypi;
          ruamel_base = pkgs.python37Packages.ruamel_base;
          ruamel_ordereddict = pkgs.python37Packages.ruamel_ordereddict;
          isPy3k = true;
     };     
     ruamel_yaml = pkgs.callPackage ./ruamel_yaml.nix {
          buildPythonPackage = pkgs.python37Packages.buildPythonPackage;
          fetchPypi = pkgs.python37Packages.fetchPypi;
          ruamel_base = pkgs.python37Packages.ruamel_base;
          ruamel_ordereddict = pkgs.python37Packages.ruamel_ordereddict;
          isPy3k = true;
          ruamel_yaml_clib = ruamel_yaml_clib;
     };
     treelib = pkgs.callPackage ./treelib.nix {
          buildPythonPackage = pkgs.python37Packages.buildPythonPackage;
          fetchPypi = pkgs.python37Packages.fetchPypi;
     };     
     jsonpath_ng = pkgs.callPackage ./jsonpath_ng.nix {
          buildPythonPackage = pkgs.python37Packages.buildPythonPackage;
          fetchPypi = pkgs.python37Packages.fetchPypi;
          decorator = pkgs.python37Packages.decorator;
          six = pkgs.python37Packages.six;
          ply = pkgs.python37Packages.ply;
          treelib = treelib;
     };
     requests = pkgs.callPackage ./requests.nix {
          buildPythonPackage = pkgs.python37Packages.buildPythonPackage;
          fetchPypi = pkgs.python37Packages.fetchPypi;
          urllib3 = pkgs.python37Packages.urllib3;
          idna = pkgs.python37Packages.idna;
          chardet = pkgs.python37Packages.chardet;
          certifi = pkgs.python37Packages.certifi;
          pytest = pkgs.python37Packages.pytest;
     };
     pathspec = pkgs.callPackage ./pathspec.nix {
          buildPythonPackage = pkgs.python37Packages.buildPythonPackage;
          fetchPypi = pkgs.python37Packages.fetchPypi;
     };
     dvc = pkgs.callPackage ./dvc.nix {
          buildPythonPackage = pkgs.python37Packages.buildPythonPackage;
          fetchPypi = pkgs.python37Packages.fetchPypi;
          GitPython = pkgs.python37Packages.GitPython.override{ gitdb2 = gitdb2; };
          humanize = pkgs.python37Packages.humanize;
          configobj = pkgs.python37Packages.configobj;
          tqdm = tqdm;
          networkx = pkgs.python37Packages.networkx;
          distro = pkgs.python37Packages.distro;
          flufl_lock = flufl_lock;
          shortuuid = pkgs.python37Packages.shortuuid;
          funcy = funcy;
          packaging = pkgs.python37Packages.packaging;
          future = pkgs.python37Packages.future;
          gitdb2 = gitdb2;
          ply = pkgs.python37Packages.ply;
          pyasn1 = pkgs.python37Packages.pyasn1;
          colorama = pkgs.python37Packages.colorama;
          ruamel_yaml = ruamel_yaml;
          asciimatics = pkgs.python37Packages.asciimatics;
          jsonpath_ng = jsonpath_ng;
          requests = requests;
          inflect = pkgs.python37Packages.inflect;
          grandalf = pkgs.python37Packages.grandalf;
          schema = pkgs.python37Packages.schema;
          nanotime = pkgs.python37Packages.nanotime;
          configparser = pkgs.python37Packages.configparser;
          pathspec = pathspec;
          appdirs = pkgs.python37Packages.appdirs;
    };
in
   pkgs.stdenv.mkDerivation {

     name = "dvc-shell";
     buildInputs = with pkgs;
                  [
                    dvc
                   ];
}
