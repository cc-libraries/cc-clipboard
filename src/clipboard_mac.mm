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
            lastHash = getContentNameHash();
            clipboardType = getClipboardType();
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
                    clipboardType = getClipboardType();
                    NSLog(@"clipboardType: %d", clipboardType);
                    clipboardData = getClipboardData();
                    callBackFunc();
                } else {
                    // NSLog(@"-- clipboard data no change --");
                }
            });

            // start timer
            dispatch_resume(_timer);

            cout << "call ClipboardMac::startClipboardMonitor1" << endl;
        }

        ClipboardType ClipboardMac::getClipboardType() {
            NSArray *supportedTypes = [NSArray arrayWithObjects: NSFilenamesPboardType, NSStringPboardType, nil];
            NSString *pasteboardType = [pasteboard availableTypeFromArray:supportedTypes];

            ClipboardType cbType = checkPasteBoardType(pasteboardType);

            return cbType;
        }

        ClipboardData* ClipboardMac::getClipboardData() {
            ClipboardData* data = NULL;

            switch(clipboardType) {
                case EN_CB_TEXT :
                {
                    NSString* textData = [pasteboard stringForType:NSStringPboardType];
                    data = convertPasteBoardData(textData, EN_CB_TEXT);
                    break;
                }
                case EN_CB_FILES : {
                    id fileData = [pasteboard propertyListForType:NSFilenamesPboardType];
                    data = convertPasteBoardData(fileData, EN_CB_FILES);
                    break;
                }
                default :
                    NSLog(@"clipboardType: %d is unknown", clipboardType);
            }

            return data;
        }

        //TODO: create ClipboardDataService class, and this method will be move to ClipboardDataService
        ClipboardData* ClipboardMac::convertPasteBoardData(id data, ClipboardType type) {
            ClipboardData* result = NULL;
            if(EN_CB_TEXT == type) {
                NSString *stringData = data;
                result = new ClipboardTextData();   //FIXME: bufferData length not alloc
                // int memLength = sizeof(ClipboardTextData) - 4 + data.length;
                // result = (ClipboardData*) malloc(memLength);
                // memset(result, 0, memLength);
                result->type = type;
                result->hash = stringData.hash;
                result->bufferLength = stringData.length;
                result->searchName = stringData.UTF8String;
                result->bufferData = data;
            } else if(EN_CB_FILES == type) {
                //TODO:
                NSData *fileData = data;
                NSString *searchName = data;
                result = new ClipboardFileData();   //FIXME: bufferData length not alloc
                NSLog(@"type is EN_CB_FILES");
                result->type = type;
                result->hash = fileData.hash;
                cout << "hash: " << fileData.hash << endl;
                result->bufferLength = CC_UI_INVALID_INIT;  //FIXME:for file the buffer length is no use here
                // cout << "bufferLength: " << bufferLength << endl;
                result->searchName = searchName.UTF8String;
                cout << "searchName: " << searchName.UTF8String;
                result->bufferData = data;
            }

            return result;
        }

        ClipboardType ClipboardMac::checkPasteBoardType(NSString *type){
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

            return EN_CB_NONE;
        }

        int ClipboardMac::isClipboardDataChanged() {
            //TODO:
            NSUInteger hash = getContentNameHash();
            NSLog(@"lastHash %li, hash %li", lastHash, hash);
            if((lastChangeCount != pasteboard.changeCount) && (lastHash != hash)) {
                lastChangeCount = pasteboard.changeCount;
                lastHash = hash;
                NSLog(@"-- clipboard changed --");
                return CC_SUCCESS;
            }

            return CC_FAILED;
        }

        NSUInteger ClipboardMac::getContentNameHash() {
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

    }   //namespace ccsys_api

}   //namespace cclib
