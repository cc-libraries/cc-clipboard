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

#include <AppKit/AppKit.h>
#include <AppKit/NSPasteboard.h>
#include <Foundation/Foundation.h>

#include "../inc/clipboard_mac.h"

namespace cclib {
    
    namespace ccsys_api {
        
        ClipboardMac::ClipboardMac() {
            //TODO: ClipboardMac
            init();
        }
        
        ClipboardMac::~ClipboardMac() {
            //TODO: ~ClipboardMac
        }
        
        bool ClipboardMac::init() {
            cout << "call ClipboardMac::init" << endl;
            return true;
        }
        
        int ClipboardMac::foo() {
            NSInteger value = flag;
            NSLog(@"CLipboardMac foo function");
            
            return value;
        }
        
    }   //namespace ccsys_api
    
}   //namespace cclib
