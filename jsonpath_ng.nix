{ stdenv
, buildPythonPackage
, fetchPypi
, decorator
, six
, ply
, treelib
}:

buildPythonPackage rec {
  pname = "jsonpath-ng";
  version = "1.4.3";

  src = fetchPypi {
    inherit pname version;
    sha256 = "b1fc75b877e9b2f46845a455fbdcfb0f0d9c727c45c19a745d02db620a9ef0be";
  };

  # No tests
  doCheck = false;

  propagatedBuildInputs = [decorator six ply treelib];

  meta = with stdenv.lib; {
    description = "A final implementation of JSONPath for Python that aims to be standard compliant, including arithmetic and binary comparison operators and providing clear AST for metaprogramming.";
    homepage = "https://github.com/h2non/jsonpath-ng";
    license = licenses.asl2;
  };

}
