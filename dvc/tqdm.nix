{ lib
, buildPythonPackage
, fetchPypi
, nose
, coverage
, glibcLocales
, flake8
}:

buildPythonPackage rec {
  pname = "tqdm";
  version = "4.38.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "c1d677f3a85fa291b34bdf8f770f877119b9754b32673699653556f85e2c2f13";
  };

  buildInputs = [ nose coverage glibcLocales flake8 ];

  postPatch = ''
    # Remove performance testing.
    # Too sensitive for on Hydra.
    rm tqdm/tests/tests_perf.py
  '';

  LC_ALL="en_US.UTF-8";

#   doCheck = !stdenv.isDarwin;
  # Test suite is too big and slow.
  doCheck = false;

  meta = {
    description = "A Fast, Extensible Progress Meter";
    homepage = https://github.com/tqdm/tqdm;
    license = with lib.licenses; [ mit ];
    maintainers = with lib.maintainers; [ fridh ];
  };
}
