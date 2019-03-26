#include <iostream>

#include "../inc/clipboard_mac.h"

using namespace std;
using namespace cclib::ccsys_api;

void func() {
    cout << "-- call func --" << endl;
}

int main(int argc, char const *argv[])
{
    /* code */
    Clipboard* cc = new ClipboardMac();

    Clipboard::ClipboardMonitorCallBackFunc aa;

    aa = func;

    cc->clipboardChangeRegistor(aa);

    // ClipboardType cbType = cc->getClipboardType();
    // cout << "ClipboardType: " << cbType << endl;

    // ClipboardData* cbData = cc->getClipboardData();
    // NSString *data = (NSString *)cbData->bufferData;
    // cout << "ClipboardData bufferData: " << cbData->searchName << endl;

    char name[1024];
    cout << "enter input: " << endl;
    cin>>name;

    return 0;
}