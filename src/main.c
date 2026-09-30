#include <raylib.h>

int main(void) {
    InitWindow(0, 0, "Platformer");
    // startet bei 0 x 0 und gibt den namen Platformer

    // Resize the window to the current monitor's resolution. These queries only
    // work once a window (graphics context) exists, so they run after InitWindow.
    int monitor = GetCurrentMonitor();
    SetWindowSize(GetMonitorWidth(monitor), GetMonitorHeight(monitor));
    int FPS = 60;
    SetTargetFPS(FPS);

    while(!WindowShouldClose()) {
        BeginDrawing();
        ClearBackground(GetColor(0x181818ff));
        EndDrawing();
    }
    CloseWindow();

    return 0;
}
