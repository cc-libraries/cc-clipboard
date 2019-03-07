#include <iostream>

#include "../inc/clipboard_mac.h"

using namespace std;
using namespace cclib::ccsys_api;

int main(int argc, char const *argv[])
{
    /* code */
    Clipboard* cc = new ClipboardMac();

    int value = cc->foo();

    cout << value << endl;

    char name[1024];
    cout << "enter input: " << endl;
    cin>>name;

    return 0;
}