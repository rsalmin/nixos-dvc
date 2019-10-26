{ lib, buildPythonPackage, fetchPypi, GitPython, humanize, configobj, tqdm, networkx, distro, flufl_lock, shortuuid, funcy, packaging, future, gitdb2, ply, pyasn1, colorama, ruamel_yaml, asciimatics, jsonpath_ng, requests, inflect, grandalf, schema, nanotime, configparser, pathspec, appdirs}:

buildPythonPackage rec {
  pname = "dvc";
  version = "0.65.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "9128009318d96843b0e0de2533b0dd7b8125891d4697e0fee5befa66b418270a";
  };

  propagatedBuildInputs = [ GitPython humanize configobj tqdm networkx distro flufl_lock shortuuid funcy packaging future gitdb2 ply pyasn1 colorama ruamel_yaml asciimatics jsonpath_ng requests inflect grandalf schema nanotime configparser pathspec appdirs];
  
  meta = with lib; {
    homepage = https://dvc.org/;
    description = "Open-source Version Control System for Machine Learning Projects";
    license = licenses.asl20;
    #maintainers = with maintainers; [ fridh ];
  };
}
