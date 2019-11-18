{ lib, buildPythonPackage, fetchPypi, GitPython, humanize, configobj, tqdm, networkx, distro, flufl_lock, shortuuid, funcy, packaging, future, gitdb2, ply, pyasn1, colorama, ruamel_yaml, asciimatics, jsonpath_ng, requests, inflect, grandalf, schema, nanotime, configparser, pathspec, appdirs}:

buildPythonPackage rec {
  pname = "dvc";
  version = "0.68.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0edc355947214880c0ccf79e4efcd7a84fedb98a2705b9d4d2ca9ddec182bb2d";
  };

  propagatedBuildInputs = [ GitPython humanize configobj tqdm networkx distro flufl_lock shortuuid funcy packaging future gitdb2 ply pyasn1 colorama ruamel_yaml asciimatics jsonpath_ng requests inflect grandalf schema nanotime configparser pathspec appdirs];

  meta = with lib; {
    homepage = https://dvc.org/;
    description = "Open-source Version Control System for Machine Learning Projects";
    license = licenses.asl20;
  };
}
