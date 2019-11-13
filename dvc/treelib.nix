{ stdenv
, buildPythonPackage
, fetchPypi
}:

buildPythonPackage rec {
  pname = "treelib";
  version = "1.5.5";

  src = fetchPypi {
    inherit pname version;
    sha256 = "44695f7048b0bd82b45a4fe976611f9fb52902506249d84db255976a5e8738e0";
  };

  # No tests
  doCheck = false;

  #propagatedBuildInputs = [decorator six ply treelib];

  meta = with stdenv.lib; {
    description = "A Python 2/3 implementation of tree structure.";
    homepage = "https://github.com/caesar0301/treelib";
    license = licenses.asl2;
  };

}
