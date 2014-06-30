native:
	cmake ../OpenMesh -DBUILD_APPS=OFF
	make

emscripten:
	emconfigure cmake ../OpenMesh -DBUILD_APPS=OFF
	emmake make
