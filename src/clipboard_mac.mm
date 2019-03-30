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
            lastChangeCount = CC_FAILED;
            lastHash = CC_FAILED;

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
                //COMMENT: get clipboard data
                NSArray *supportedTypes = [NSArray arrayWithObjects: NSFilenamesPboardType, NSStringPboardType, nil];
                NSString *type = [pasteboard availableTypeFromArray:supportedTypes];
                NSData* cbData = [pasteboard dataForType:type];
                NSString* strData = [pasteboard stringForType:type];
                id fileData = [pasteboard propertyListForType:type];

                if(isClipboardDataChanged(cbData)) {
                    //COMMENT: get searchName
                    NSArray *classes = [[NSArray alloc] initWithObjects:[NSString class], nil];
                    NSDictionary *options = [NSDictionary dictionary];
                    NSArray *copiedItems = [pasteboard readObjectsForClasses:classes options:options];
                    cout << "-- call ClipboardMac::startClipboardMonitor1 --" << endl;
                    NSString *name = copiedItems[0];    //COMMENT: if clipboard must have search name

                    convertClipboardData(cbData, fileData, strData, type, name);
                    callBackFunc();
                }
            });

            // start timer
            dispatch_resume(_timer);
        }

        int ClipboardMac::setClipboardData(ClipboardData* data){
            IS_POINT_NULL_INT(data);

            //FIXED: fix setString failed error
            [pasteboard clearContents];

            if(EN_CB_FILES == data->type) {
                id buffer = (id)data->bufferData;
                cout << "setClipboardData: NSFilenamesPboardType" << endl;
                //ERROR: Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: 'Could not write property list with invalid format to the pasteboard.  The object contains non-property list types: __NSSetM'
                return [pasteboard setPropertyList:buffer forType:NSFilenamesPboardType];
            } else if(EN_CB_TEXT == data->type) {
                NSString* buffer = (NSString*)data->bufferData;
                cout << "setClipboardData: NSStringPboardType" << endl;
                return [pasteboard setString:buffer forType:NSStringPboardType];
            } else {
                cout << "setClipboardData: NSRTFDPboardType" << endl;
                return CC_INVALID;
            }
        }

        int ClipboardMac::convertClipboardData(NSData* data, id fileData, NSString* strData, NSString* type, NSString* name) {
            IS_POINT_NULL_INT(data);

            // int memLength = sizeof(ClipboardTextData) - 4 + data.length;
            // result = (ClipboardData*) malloc(memLength);
            // memset(result, 0, memLength);
            if([NSFilenamesPboardType isEqualToString:type]) {
                cout << "convertClipboardData: NSFilenamesPboardType" << endl;
                clipboardData.type = EN_CB_FILES;
                clipboardData.bufferData = fileData;
            } else if([NSStringPboardType isEqualToString:type]) {
                cout << "convertClipboardData: NSStringPboardType" << endl;
                clipboardData.type = EN_CB_TEXT;
                clipboardData.bufferData = strData;
            } else {
                cout << "convertClipboardData: NSRTFDPboardType" << endl;
                clipboardData.type = EN_CB_NONE;
                return CC_FAILED;
            }

            clipboardData.hash = data.hash;
            clipboardData.bufferLength = data.length;
            cout << "convertClipboardData: name: " << name.UTF8String << endl;
            clipboardData.searchName = (char*)name.UTF8String;

            return CC_SUCCESS;
        }

        int ClipboardMac::isClipboardDataChanged(NSData* cbData) {
            //TODO:
            NSUInteger hash = cbData.hash;
            if((lastChangeCount != pasteboard.changeCount) && (lastHash != hash)) {
                lastChangeCount = pasteboard.changeCount;
                lastHash = hash;
                NSLog(@"-- clipboard changed --");
                return CC_SUCCESS;
            }

            return CC_FAILED;
        }

    }   //namespace ccsys_api

}   //namespace cclib
