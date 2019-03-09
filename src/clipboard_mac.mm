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
            changeCount = pasteboard.changeCount;
            NSLog(@"changeCount: %li", changeCount);

            startClipboardMonitor();

            return 0;
        }

        int ClipboardMac::foo() {
            int value = flag;
            NSLog(@"-- CLipboardMac foo function --");
            return value;
        }

        void ClipboardMac::startClipboardMonitor() {
            cout << "-- call ClipboardMac::startClipboardMonitor --" << endl;

            // create timer
            dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
            dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 0.5 * NSEC_PER_SEC, 0); //timer for 1 seconds
            // event handler
            dispatch_source_set_event_handler(_timer, ^{
                //TODO: call function
                NSLog(@"-- call startClipboardMonitor function --");
                if(isClipboardDataChanged()) {
                    ClipboardData* getClipboardData();
                } else {
                    NSLog(@"-- clipboard data no change --");
                }
            });

            // start timer
            dispatch_resume(_timer);

            cout << "call ClipboardMac::startClipboardMonitor1" << endl;
        }

        int ClipboardMac::isClipboardDataChanged() {
            //TODO:
            if(changeCount == pasteboard.changeCount) {
                NSLog(@"-- clipboard no changed --");
                return 0;
            } else {
                changeCount = pasteboard.changeCount;
                NSLog(@"clipboard context count changed to: %li", changeCount);
            }
            return 0;
        }

        ClipboardData* ClipboardMac::getClipboardData() {
            //TODO:
            cout << "call ClipboardMac::getClipboardData" << endl;
            return NULL;
        }

    }   //namespace ccsys_api

}   //namespace cclib
