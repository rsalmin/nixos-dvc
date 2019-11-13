{ lib
, buildPythonPackage
, fetchPypi
, six
}:

buildPythonPackage rec {
  pname = "promise";
  version = "2.2.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "348f5f6c3edd4fd47c9cd65aed03ac1b31136d375aa63871a57d3e444c85655c";
  };

  buildInputs = [ six ];

  doCheck = false;

  meta = with lib; {
    description = "Promises/A+ implementation for Python";
    homepage = https://pypi.org/project/promise/;
    license = licenses.mit;
  };
}
