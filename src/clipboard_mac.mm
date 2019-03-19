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

        int ClipboardMac::init() {
            pasteboard = [NSPasteboard generalPasteboard];
            lastChangeCount = pasteboard.changeCount;
            lastHash = getCurrentContentNameHash();
            // startClipboardMonitor();

            return 0;
        }

        int ClipboardMac::foo() {
            int value = flag;
            NSLog(@"-- CLipboardMac foo function --");
            return value;
        }

        void ClipboardMac::clipboardChangeRegistor(ClipboardMonitorCallBackFunc callBackFunc) {
            cout << "-- call ClipboardMac::startClipboardMonitor --" << endl;

            // create timer
            dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
            //TODO:timer for 1 seconds, will be change to the configure file, for developer to change
            dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1 * NSEC_PER_SEC, 0);
            // event handler
            dispatch_source_set_event_handler(_timer, ^{
                //TODO: call function
                NSLog(@"-- call startClipboardMonitor function --");
                if(isClipboardDataChanged()) {
                    NSLog(@"-- call callback function --");
                    callBackFunc();
                } else {
                    // NSLog(@"-- clipboard data no change --");
                }
            });

            // start timer
            dispatch_resume(_timer);

            cout << "call ClipboardMac::startClipboardMonitor1" << endl;
        }

        int ClipboardMac::isClipboardDataChanged() {
            //TODO:
            NSUInteger hash = getCurrentContentNameHash();
            NSLog(@"lastHash %li, hash %li", lastHash, hash);
            if((lastChangeCount != pasteboard.changeCount) && (lastHash != hash)) {
                lastChangeCount = pasteboard.changeCount;
                lastHash = hash;
                NSLog(@"-- clipboard changed --");
                return CC_SUCCESS;
            }

            return CC_FAILED;
        }

        NSUInteger ClipboardMac::getCurrentContentNameHash() {
            IS_POINT_NULL_UINT(pasteboard);

            NSArray *classes = [[NSArray alloc] initWithObjects:[NSString class], nil];
            NSDictionary *options = [NSDictionary dictionary];
            NSArray *copiedItems = [pasteboard readObjectsForClasses:classes options:options];
            //TODO: just concerned about 1 item
            if (copiedItems != nil && 1 == copiedItems.count) {
                NSString *item = copiedItems[0];

                return item.hash;
            } else {    //TODO: just get log
                NSLog(@"type count: %lu", copiedItems.count);
                for(int i = 0; i < copiedItems.count; i++) {
                    NSString *item = copiedItems[i];
                    NSLog(@"text: %@", item);
                    NSLog(@"text: %li", item.hash);
                }
            }

            return CC_UI_FAILED;
        }

        ClipboardData* ClipboardMac::getCurrentClipboardData() {
            //TODO:
            cout << "call ClipboardMac::getClipboardData" << endl;
            return NULL;
        }

    }   //namespace ccsys_api

}   //namespace cclib
