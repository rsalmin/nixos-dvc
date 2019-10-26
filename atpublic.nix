{ lib, buildPythonPackage, fetchPypi}:

buildPythonPackage rec {
  pname = "atpublic";
  version = "1.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "7dca670499e9a9d3aae5a8914bc799475fe24be3bcd29c8129642dda665f7a44";
  };
  
  doCheck = false;

  meta = with lib; {
    homepage = https://public.readthedocs.io/en/latest/;
    description = "public -- @public for populating __all__";
    license = licenses.asl20;
  };
}
