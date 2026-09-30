# bszgame

> TODO: find better name

## Plans

- Strategy Platformer
- maybe Multiplayer?

## Tech

- C + [Raylib](https://github.com/raysan5/raylib): language + library/framework/engine
- Makefile: build tool

## How to build

Raylib is vendored as a git submodule. If you didn't clone with
`--recursive`, the build fetches it automatically; you can also do it
manually with `git submodule update --init --recursive`.

### Linux

```shell
make
make run # run it.
```

### Windows

Only `git` is required — no compiler to install. On the first run,
`build.bat` downloads a portable toolchain (w64devkit, ~90 MB) into
`external/w64devkit`; after that it just builds and runs.

```powershell
git clone --recursive <repo-url>
cd bszgame
.\build.bat   # in PowerShell the leading .\ is required
```

Or just double-click `build.bat` in Explorer.

<sub>Advanced: to fetch the toolchain manually without building, run
`powershell -ExecutionPolicy Bypass -File tools\setup-windows.ps1`.</sub>

## Conventions

- own functions follow snake case: `close_window()`, `say_something_smart(char *what)`, etc.
- all raylib functions use camel case: `InitWindow()`, `GetColor(0x181818ff)`, etc.
