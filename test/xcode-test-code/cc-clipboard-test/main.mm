//COMPILE: g++ -framework AppKit -framework Foundation -o main main.mm src/clipboard.mm
#include <iostream>

#include "inc/clipboard.h"

using namespace std;
using namespace cclib::ccsys_api;

int main(int argc, char const *argv[])
{
    /* code */
    Clipboard* cc = new Clipboard();

    cc->startClipboardMonitor();

    return 0;
}
