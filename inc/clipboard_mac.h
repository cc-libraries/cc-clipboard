/*********************************************************************
 * cc-clipboard
 *
 * Copyright (c) 2019 cc-clipboard contributors:
 *   - hello_chenchen <https://github.com/hello-chenchen>
 *
 * MIT License <https://github.com/hello-chenchen/cc-clipboard/blob/master/LICENSE>
 * See https://github.com/hello-chenchen/cc-clipboard for the latest update to this file
 *
 * author: hello_chenchen <https://github.com/hello-chenchen>
 **********************************************************************************/

#ifndef CCLIB_CCSYS_API_CLIPBOARD_MAC_H_
#define CCLIB_CCSYS_API_CLIPBOARD_MAC_H_

#include <AppKit/AppKit.h>
#include <AppKit/NSPasteboard.h>
#include <Foundation/Foundation.h>

#include "clipboard.h"

namespace cclib {

    namespace ccsys_api {

        class ClipboardMac : public Clipboard {

            public:
                ClipboardMac();
                ~ClipboardMac();

            public:
                int init();
                int foo();
                void clipboardChangeRegistor(ClipboardMonitorCallBackFunc callBackFunc);

            private:
                int isClipboardDataChanged(NSData* cbData);
                int setClipboardData(NSData* data, NSString* type);

            private:
                NSPasteboard *pasteboard;
                NSInteger lastChangeCount;
                NSUInteger lastHash;
                NSData *pasteboardData;
                // NSString* searchName;

        };  //class ClipboardMac
    }



}   //namespace cclib

#endif  //CCLIB_CCSYS_API_CLIPBOARD_MAC_H_
