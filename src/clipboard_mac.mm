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

        //for current
        // const NSArray *SUPPORTEDTYPES = [NSArray arrayWithObjects: NSFilenamesPboardType, NSStringPboardType, nil];

        ClipboardMac::ClipboardMac() {
            //TODO: ClipboardMac
            init();
        }

        ClipboardMac::~ClipboardMac() {
            //TODO: ~ClipboardMac
        }

        int ClipboardMac::init() {
            pasteboard = [NSPasteboard generalPasteboard];
            lastChangeCount = CC_UI_FAILED;
            lastHash = CC_UI_FAILED;
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
                NSArray *SUPPORTEDTYPES = [NSArray arrayWithObjects: NSFilenamesPboardType, NSStringPboardType, nil];
                NSString *type = [pasteboard availableTypeFromArray:SUPPORTEDTYPES];
                NSData* cbData = [pasteboard dataForType:type];
                if(isClipboardDataChanged(cbData)) {
                    NSLog(@"-- call callback function --");
                    setClipboardData(cbData, type);
                    callBackFunc();
                } else {
                    // NSLog(@"-- clipboard data no change --");
                }
            });

            // start timer
            dispatch_resume(_timer);

            cout << "call ClipboardMac::startClipboardMonitor1" << endl;
        }

        int ClipboardMac::setClipboardData(NSData* data, NSString* type) {
            IS_POINT_NULL_INT(data);

            ClipboardData* result = new ClipboardData();    //FIXME: bufferData length not alloc
            NSString *stringData = (NSString *)data;
            // int memLength = sizeof(ClipboardTextData) - 4 + data.length;
            // result = (ClipboardData*) malloc(memLength);
            // memset(result, 0, memLength);
            if([NSFilenamesPboardType isEqualToString:type]) {
                cout << "checkPasteBoardType: NSFilenamesPboardType" << endl;
                result->type = EN_CB_FILES;
            } else if([NSStringPboardType isEqualToString:type]) {
                cout << "checkPasteBoardType: NSStringPboardType" << endl;
                result->type = EN_CB_TEXT;
            } else if([NSRTFDPboardType isEqualToString:type]) {
                cout << "checkPasteBoardType: NSRTFDPboardType" << endl;
                result->type = EN_CB_NONE;
                return CC_FAILED;
            }

            result->hash = stringData.hash;
            result->bufferLength = stringData.length;
            result->searchName = (char *)stringData.UTF8String;
            result->bufferData = data;

            return CC_SUCCESS;
        }

        int ClipboardMac::isClipboardDataChanged(NSData* cbData) {
            //TODO:
            NSUInteger hash = cbData.hash;
            NSLog(@"lastHash %li, hash %li", lastHash, hash);
            if((lastChangeCount != pasteboard.changeCount) && (lastHash != hash)) {
                lastChangeCount = pasteboard.changeCount;
                lastHash = hash;
                NSLog(@"-- clipboard changed --");
                return CC_SUCCESS;
            }

            return CC_FAILED;
        }

        // NSUInteger ClipboardMac::getClipboardContentHash() {
        //     IS_POINT_NULL_UINT(pasteboardData);

        //     return pasteboardData.hash;
        //     // NSArray *classes = [[NSArray alloc] initWithObjects:[NSString class], nil];
        //     // NSDictionary *options = [NSDictionary dictionary];
        //     // NSArray *copiedItems = [pasteboard readObjectsForClasses:classes options:options];
        //     // //TODO: just concerned about 1 item
        //     // if (copiedItems != nil && 1 == copiedItems.count) {
        //     //     NSString *item = copiedItems[0];

        //     //     return item.hash;
        //     // } else {    //TODO: just get log
        //     //     NSLog(@"type count: %lu", copiedItems.count);
        //     //     for(int i = 0; i < copiedItems.count; i++) {
        //     //         NSString *item = copiedItems[i];
        //     //         NSLog(@"text: %@", item);
        //     //         NSLog(@"text: %li", item.hash);
        //     //     }
        //     // }
        // }

        //TODO: create ClipboardDataService class, and this method will be move to ClipboardDataService
        // ClipboardData* ClipboardMac::convertPasteBoardData(ClipboardType type, NSUInteger hash, NSString *name, id data, NSUInteger length) {
        //     ClipboardData* result = NULL;
        //     if(EN_CB_TEXT == type) {
        //         NSString *stringData = data;
        //         result = new ClipboardTextData();   //FIXME: bufferData length not alloc
        //         // int memLength = sizeof(ClipboardTextData) - 4 + data.length;
        //         // result = (ClipboardData*) malloc(memLength);
        //         // memset(result, 0, memLength);
        //         result->type = type;
        //         result->hash = stringData.hash;
        //         result->bufferLength = stringData.length;
        //         result->searchName = stringData.UTF8String;
        //         result->bufferData = data;
        //     } else if(EN_CB_FILES == type) {
        //         //TODO:
        //         NSData *fileData = data;
        //         NSString *searchName = data;
        //         result = new ClipboardFileData();   //FIXME: bufferData length not alloc
        //         NSLog(@"type is EN_CB_FILES");
        //         result->type = type;
        //         result->hash = fileData.hash;
        //         cout << "hash: " << fileData.hash << endl;
        //         result->bufferLength = CC_UI_INVALID_INIT;  //FIXME:for file the buffer length is no use here
        //         // cout << "bufferLength: " << bufferLength << endl;
        //         //ERROR:-[__NSArrayM UTF8String]: unrecognized selector sent to instance 0x7fa3a1705150
        //         result->searchName = searchName.UTF8String;
        //         cout << "searchName: " << searchName.UTF8String;
        //         result->bufferData = data;
        //     }

        //     return result;
        // }

    }   //namespace ccsys_api

}   //namespace cclib
