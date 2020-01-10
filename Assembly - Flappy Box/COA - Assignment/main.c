#include <stdlib.h>
#include <stdio.h>
#include <windows.h>
#include <windows.graphics.h>
#include <conio.h>
#include <dos.h>
#include <wchar.h>
#pragma warning(disable:4996)

HANDLE outHnd;    // Handle to write to the console.
HANDLE inHnd;    // Handle to read from the console.
DWORD prev_mode; // Set the console mode to 
CONSOLE_CURSOR_INFO ConCurInf; //Cursor info

//void setup();
extern void begin();
extern void setup(short x, short y);
extern void game();
extern void menu();
extern void setEdit();
extern void setNoEdit();
extern void clearScreen();
extern void gameOver();
extern void fontSize(int size);
extern void gmain();
int main(int args[]) {

	int p = 0;
	setup(120, 30);
	begin();
	do {
		setup(30, 40);
		menu();
	} while (p == 0);


	return 0;
}
void setup(short x, short y) {
	outHnd = GetStdHandle(STD_OUTPUT_HANDLE);	// Get outhandle if allow
	inHnd = GetStdHandle(STD_INPUT_HANDLE);		// Get inhandle if allow

	SetConsoleTitle("Flappy Box");	// Change the window title

	SMALL_RECT empty = { 0, 0, 0, 0 };
	SetConsoleWindowInfo(outHnd, TRUE, &empty);

	COORD bufferSize = { x, y };	// Create a COORD to hold the buffer size
	SetConsoleScreenBufferSize(outHnd, bufferSize);	// Change the console window size
	// Set up the required window size:
	SMALL_RECT windowSize = { 0, 0, bufferSize.X - 1, bufferSize.Y - 1 };
	SetConsoleWindowInfo(outHnd, TRUE, &windowSize);



	// Set the console cannot be resize
	HWND consoleWindow = GetConsoleWindow();
	SetWindowLong(consoleWindow, GWL_STYLE, GetWindowLong(consoleWindow, GWL_STYLE) & ~WS_MAXIMIZEBOX & ~WS_SIZEBOX);

	// Make the select cannot be function && Only [mark] can select
	setNoEdit();

	// Cursor invisible
	ConCurInf.dwSize = 10;
	ConCurInf.bVisible = FALSE;
	SetConsoleCursorInfo(outHnd, &ConCurInf);

	fontSize(12);
}
void setNoEdit() {

	GetConsoleMode(inHnd, &prev_mode);
	SetConsoleMode(inHnd, ENABLE_EXTENDED_FLAGS & (prev_mode & ~ENABLE_QUICK_EDIT_MODE));
}
void setEdit() {
	/*ConCurInf.dwSize = 10;
	ConCurInf.bVisible = TRUE;
	SetConsoleCursorInfo(outHnd, &ConCurInf);*/
	GetConsoleMode(inHnd, &prev_mode);
	SetConsoleMode(inHnd, ~ENABLE_QUICK_EDIT_MODE | ENABLE_EXTENDED_FLAGS);

}
void fontSize(int size) {
	CONSOLE_FONT_INFOEX info = { 0 }; //<- "CONSOLE_FONT_INFOEX was not declared in this scope"
	info.cbSize = sizeof(info);
	info.dwFontSize.Y = size + 4; // leave X as zero
	info.dwFontSize.X = size;
	info.FontWeight = FW_NORMAL;
	SetCurrentConsoleFontEx(GetStdHandle(STD_OUTPUT_HANDLE), NULL, &info);
}

void color(int ForgC) {
	WORD wColor;
	CONSOLE_SCREEN_BUFFER_INFO csbi;

	// We use csbi for the wAttributes word.
	if (GetConsoleScreenBufferInfo(outHnd, &csbi))
	{
		// Mask out all but the background attribute, and add in the forgournd color
		wColor = (csbi.wAttributes & 0xF0) + (ForgC & 0x0F);
		SetConsoleTextAttribute(outHnd, wColor);
	}
}

void ClearConsoleToColors(int ForgC, int BackC)
{
	WORD wColor = ((BackC & 0x0F) << 4) + (ForgC & 0x0F);
	//Get the handle to the current output buffer...
	HANDLE hStdOut = GetStdHandle(STD_OUTPUT_HANDLE);
	//This is used to reset the carat/cursor to the top left.
	COORD coord = { 0, 0 };
	//A return value... indicating how many chars were written
	  //   not used but we need to capture this since it will be
		//   written anyway (passing NULL causes an access violation).
	DWORD count;

	//This is a structure containing all of the console info
	// it is used here to find the size of the console.
	CONSOLE_SCREEN_BUFFER_INFO csbi;
	//Here we will set the current color
	SetConsoleTextAttribute(hStdOut, wColor);
	if (GetConsoleScreenBufferInfo(hStdOut, &csbi)) {
		//This fills the buffer with a given character (in this case 32=space).
		FillConsoleOutputCharacter(hStdOut, (TCHAR)32, csbi.dwSize.X * csbi.dwSize.Y, coord, &count);

		FillConsoleOutputAttribute(hStdOut, csbi.wAttributes, csbi.dwSize.X * csbi.dwSize.Y, coord, &count);
		//This will set our cursor position for the next print statement.
		SetConsoleCursorPosition(hStdOut, coord);
	}
}

void clearScreen() {
	ClearConsoleToColors(15, 0);
	system("cls");
}

