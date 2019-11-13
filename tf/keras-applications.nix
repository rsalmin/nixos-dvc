{ lib, buildPythonPackage, fetchPypi, numpy, h5py }:

buildPythonPackage rec {
  pname = "Keras_Applications";
  version = "1.0.8";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1rcz31ca4axa6kzhjx4lwqxbg4wvlljkj8qj9a7p9sfd5fhzjyam";
  };

  # Cyclic dependency: keras-applications requires keras, which requires keras-applications
  postPatch = ''
    sed -i "s/keras>=[^']*//" setup.py
  '';

  # No tests in PyPI tarball
  doCheck = false;

  propagatedBuildInputs = [ numpy h5py ];

  meta = with lib; {
    description = "Reference implementations of popular deep learning models";
    homepage = https://github.com/keras-team/keras-applications;
    license = licenses.mit;
  };
}
