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

#include "../inc/clipboard.h"

// extern "C" {
    #include <AppKit/AppKit.h>
    #include <AppKit/NSPasteboard.h>
    #include <Foundation/Foundation.h>
    @protocol NSPasteboardType;
// }

// @protocol NSPasteboardType;

namespace cclib {

    namespace ccsys_api {

        Clipboard::Clipboard() {
            //TODO: CLipboard
            init();
        }

        Clipboard::~Clipboard() {
            //TODO:
        }

        bool Clipboard::init() {
            cout << "call Clipboard::init" << endl;

            startClipboardMonitor();
            flag = -1;
            return false;
        }

        void Clipboard::startClipboardMonitor() {
            //TODO:
            cout << "call Clipboard::startClipboardMonitor" << endl;

            int cc = CC_HEADER;

            cout << "cc : " << cc << endl;

            NSPasteboard* clipboard = [NSPasteboard generalPasteboard];
            // NSString *pasteboardName = clipboard.NSPasteboardName;
            NSArray<NSPasteboardItem *> *pasteboardItems = clipboard.pasteboardItems;

            NSLog(@"pasteboardName: %li", pasteboardItems.count);
            // NSArray<NSPasteboardType> *types = clipboard.types;

            // for(int i = 0; i < types.count; i++) {
            //     checkPasteBoardType(types[i]);
            // }

            // for(int i =0; i < pasteboardItems.count; i++) {
            //     NSPasteboardItem *item = pasteboardItems[i];
            //     NSLog(@"item: @", item);
            // }

            NSArray *supportedTypes =
            [NSArray arrayWithObjects: NSFilenamesPboardType, NSStringPboardType, NSRTFDPboardType, nil];
            NSString *bestType = [clipboard availableTypeFromArray:supportedTypes];

            NSLog(@"bestType: %@", bestType);
            checkPasteBoardType(bestType);
        }

        ClipboardType Clipboard::checkPasteBoardType(NSString *type){
            if([NSFilenamesPboardType isEqualToString:type]) {
                cout << "checkPasteBoardType: NSFilenamesPboardType" << endl;
                return EN_CB_FILES;
            } else if([NSStringPboardType isEqualToString:type]) {
                cout << "checkPasteBoardType: NSStringPboardType" << endl;
                return EN_CB_TEXT;
            } else if([NSRTFDPboardType isEqualToString:type]) {
                cout << "checkPasteBoardType: NSRTFDPboardType" << endl;
                return EN_CB_TEXT;
            }

            return EN_CB_TEXT;
        }

    }   //namespace ccsys_api

} //namespace cclib
