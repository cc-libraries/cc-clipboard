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

#include "clipboard_mac.h"

namespace cclib{

ClipboardMac::ClipboardMac() {
    //TODO: ClipboardMac
}

ClipboardMac::~ClipboardMac() {
    //TODO: ~ClipboardMac
}

size_t ClipboardMac::foo() {
    NSInteger value = flag;
    NSLog(@"CLipboardMac foo function");

    return value;
}

}