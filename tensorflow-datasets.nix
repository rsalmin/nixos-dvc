{ lib
, buildPythonPackage
, fetchPypi
, protobuf
, requests
, dill
, promise
, absl-py
, future
, tensorflow-metadata
, termcolor
, tqdm
, attrs
, numpy
, wrapt
, googleapis-common-protos
}:

buildPythonPackage rec {
  pname = "tensorflow-datasets";
  version = "1.3.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "3da829313f7abc9e6d809661a59d1ab015cfa623b362d96166ac211838f1c077";
  };

  buildInputs = [ protobuf requests dill promise absl-py future tensorflow-metadata termcolor tqdm attrs numpy wrapt googleapis-common-protos];

  doCheck = false;

  meta = with lib; {
    description = "tensorflow/datasets is a library of datasets ready to use with TensorFlow.";
    homepage = https://pypi.org/project/tensorflow-datasets/;
    license = licenses.asl20;
  };
}
