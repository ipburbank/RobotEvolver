all: bullet_native bullet_emscripten

bullet_native:
	cd BuildNative && \
	cmake ../bullet -G "Unix Makefiles" && \
	make -j8

bullet_emscripten:
	cd BuildEmscripten && \
	emconfigure cmake ../bullet -G "Unix Makefiles" && \
	emmake make -j8
