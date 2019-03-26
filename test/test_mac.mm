#include <iostream>

#include "../inc/clipboard_mac.h"

using namespace std;
using namespace cclib::ccsys_api;

Clipboard* cc = new ClipboardMac();
Clipboard::ClipboardMonitorCallBackFunc aa;

ClipboardData* cbData1 = NULL;
ClipboardData* cbData2 = new ClipboardData();

// NSString* buffer1 = @"buffer1";
// NSString* buffer2 = @"buffer2";
int flag = 0;
int flag1 = 0;
int flag2 = 0;

void func() {
    ClipboardType cbType = cc->getType();
    cout << "---- ClipboardType: ----" << cbType << endl;

    if(0 == flag) {
        cout << "-- func1: --" << endl;
        ClipboardData* cbData = cc->getClipboardData();
        cbData1 = (ClipboardData*) malloc(sizeof(ClipboardData)  - 4 + cbData->bufferLength );
        // cout << "-- func1: --" << sizeof(ClipboardData) - 4 + cbData->bufferLength << endl;
        // buffer1 = (NSString *)cbData->bufferData;
        memcpy(cbData1, cbData, sizeof(ClipboardData) -4 + cbData->bufferLength);
        flag = 1;
        flag1 = 1;
    } else {
        cout << "-- func4: --" << endl;
        ClipboardData* cbData = cc->getClipboardData();
        cbData2 = (ClipboardData*) malloc(sizeof(ClipboardData)  - 4 + cbData->bufferLength );
        memcpy(cbData2, cbData, sizeof(ClipboardData) -4 + cbData->bufferLength);
        // buffer1 = (NSString *)cbData->bufferData;
        flag = 0;
        flag2 = 1;
    }

    int result = 10;
    if((1 == flag1) && (1 == flag2)) {
        cout << "cb1: " << cbData1 << endl;
        cout << "cb2: " << cbData2 << endl;
        NSString* buffer1 = (NSString *)cbData1->bufferData;
        NSLog(@"text1: %@", buffer1);
        NSString* buffer2 = (NSString *)cbData2->bufferData;
        NSLog(@"text2: %@", buffer2);

        if(0 == flag) {
            cout << "--- func2: ---" << endl;
            // cout << "cbData1: " << (char *)cbData1->bufferData << endl;
            result = cc->setClipboardData(cbData1);
            cout << "--- func21: ---" << result << endl;
        } else {
            cout << "--- func3: ---" << endl;
            // cout << "cbData2: " << (char *)cbData2->bufferData << endl;
            result = cc->setClipboardData(cbData2);
            cout << "--- func31: ---" << result << endl;
        }
    }

}

int main(int argc, char const *argv[])
{
    /* code */

    aa = func;

    cc->clipboardChangeRegistor(aa);

    // ClipboardData* cbData = cc->getClipboardData();
    // NSString *data = (NSString *)cbData->bufferData;
    // cout << "ClipboardData bufferData: " << cbData->searchName << endl;

    char name[1024];
    cout << "enter input: " << endl;
    cin>>name;

    return 0;
}