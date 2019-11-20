{ lib, buildPythonPackage, fetchPypi, GitPython, humanize, configobj, tqdm, networkx, distro, flufl_lock, shortuuid, funcy, packaging, future, gitdb2, ply, pyasn1, colorama, ruamel_yaml, asciimatics, jsonpath_ng, requests, inflect, grandalf, schema, nanotime, configparser, pathspec, appdirs, pyyaml}:

buildPythonPackage rec {
  pname = "dvc";
  version = "0.70.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0694a320e4eb37409dab10c47e650c682a72f381ae89dafccd0e3a1903a92d90";
  };

  propagatedBuildInputs = [ GitPython humanize configobj tqdm networkx distro flufl_lock shortuuid funcy packaging future gitdb2 ply pyasn1 colorama ruamel_yaml asciimatics jsonpath_ng requests inflect grandalf schema nanotime configparser pathspec appdirs pyyaml];

  meta = with lib; {
    homepage = https://dvc.org/;
    description = "Open-source Version Control System for Machine Learning Projects";
    license = licenses.asl20;
  };
}
