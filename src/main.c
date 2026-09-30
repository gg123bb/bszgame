#include <raylib.h>

int main(void) {
    InitWindow(800, 600, "bszgame");
    while(!WindowShouldClose()) {
        BeginDrawing();
        ClearBackground(GetColor(0x181818ff));
        EndDrawing();
    }
    CloseWindow();
    
    return 0;
}
