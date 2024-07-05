{ 
  lib,
  buildPythonPackage,
  fetchPypi,
  pythonOlder,
  pytestCheckHook,
}:

buildPythonPackage rec {
  pname = "build123d";
  version = "0.5.0";
  format = "pyproject";

  disabled = pythonOlder "3.9";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-AAAA";
  };

  pythonImportsCheck = [ "build123d" ];

  nativeCheckInputs = [
    pytestCheckHook
  ];

  meta = {
    description = "A python CAD programming library";
    longDescription = ''
      Build123d is a python-based, parametric, boundary representation (BREP)
      modeling framework for 2D and 3D CAD. It's built on the Open Cascade
      geometric kernel and allows for the creation of complex models using a 
      simple and intuitive python syntax. Build123d can be used to create models
      for 3D printing, CNC machining, laser cutting, and other manufacturing processes.
      
      Models can be exported to a wide variety of popular CAD tools such as FreeCAD and SolidWorks.
    '';
    homepage = "https://github.com/gumyr/build123d";
    license = lib.licenses.asl20;
    maintainers = [ lib.maintainers.k3d3 ];
  };
}
