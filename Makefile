# settings
CC ?= cc
AR ?= ar

CFLAGS ?= -Wall -Wextra -O3 -ggdb -I./external/raylib/src

ifeq ($(OS),Windows_NT)
	OUTPATH ?= bin/bszgame.exe
	# Windows (mingw / w64devkit): link raylib against the Win32/OpenGL libs
	LDFLAGS ?= -L./bin -l:libraylib.a -lopengl32 -lgdi32 -lwinmm
	RAYLIB_PLATFORM ?= PLATFORM_DESKTOP
else
	OUTPATH ?= bin/bszgame
	LDFLAGS ?= -L./bin -l:libraylib.a -lm -lX11
	RAYLIB_PLATFORM ?= PLATFORM_DESKTOP
endif

$(OUTPATH): src/main.c bin/libraylib.a | bin
	$(CC) $(CFLAGS) $< $(LDFLAGS) -o $@

.PHONY: run
run: $(OUTPATH)
	@$(OUTPATH)

bin/libraylib.a external/raylib/src/libraylib.a: external/raylib/src/Makefile | bin
	$(MAKE) -C external/raylib/src CC=$(CC) AR=$(AR) PLATFORM=$(RAYLIB_PLATFORM)
	mv external/raylib/src/libraylib.a $@

# Fetch the raylib source (git submodule) automatically if it is missing.
external/raylib/src/Makefile:
	git submodule update --init --recursive external/raylib

bin:
	mkdir -p $@
