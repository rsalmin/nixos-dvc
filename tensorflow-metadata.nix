{ lib
, buildPythonPackage
, fetchPypi
, googleapis-common-protos
}:

buildPythonPackage rec {
  pname = "tensorflow_metadata";
  version = "0.15.0";
  format = "wheel";

  src = fetchPypi {
    inherit pname version;
    sha256 = "d613deb189a66a5fad2a45cba95a518c4c1cd9da8744f261c77964299c930497";
    format = "wheel";
  };

  buildInputs = [ googleapis-common-protos];

  doCheck = false;

  meta = with lib; {
    description = "Library and standards for schema and statistics.";
    homepage = https://pypi.org/project/tensorflow-metadata/;
    license = licenses.asl20;
  };
}
