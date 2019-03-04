#include <iostream>

#include "../inc/clipboard_x11.h"

using namespace std;
using namespace cclib::ccsys_api;

int main(int argc, char const *argv[])
{
    /* code */
    Clipboard* cc = new ClipboardX11();

    int value = cc->foo();

    cout << value << endl;

    return 0;
}
