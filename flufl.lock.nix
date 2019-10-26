{ lib, buildPythonPackage, fetchPypi, atpublic}:

buildPythonPackage rec {
  pname = "flufl.lock";
  version = "3.2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "a8d66accc9ab41f09961cd8f8db39f9c28e97e2769659a3567c63930a869ff5b";
  };
  
  propagatedBuildInputs = [ atpublic ];

  meta = with lib; {
    homepage = https://pypi.org/project/flufl.lock/3.2;
    description = "NFS-safe file locking with timeouts for POSIX systems.";
    license = licenses.asl20;
  };
}
