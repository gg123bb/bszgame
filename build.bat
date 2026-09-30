@echo off
REM ---------------------------------------------------------------------------
REM  build.bat - build and run bszgame on Windows using the local w64devkit.
REM  Double-click this file, or run it from a terminal.
REM
REM  First time? Run tools\setup-windows.ps1 once to download the toolchain.
REM ---------------------------------------------------------------------------
setlocal

set "ROOT=%~dp0"
set "DEVKIT=%ROOT%external\w64devkit"

if not exist "%DEVKIT%\bin\gcc.exe" (
    echo Toolchain not found. Running one-time setup...
    powershell -ExecutionPolicy Bypass -File "%ROOT%tools\setup-windows.ps1"
    if errorlevel 1 (
        echo.
        echo Setup failed. See the messages above.
        pause
        exit /b 1
    )
)

REM Put w64devkit's gcc/make/unix-tools first on PATH for this session only.
set "PATH=%DEVKIT%\bin;%PATH%"

echo ==^> Building...
make run
if errorlevel 1 (
    echo.
    echo Build failed. See the messages above.
    pause
    exit /b 1
)

endlocal
