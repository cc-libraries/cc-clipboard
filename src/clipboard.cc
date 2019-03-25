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

namespace cclib {

        namespace ccsys_api {

            Clipboard::Clipboard() {
                //TODO: CLipboard
                init();
            }

            Clipboard::~Clipboard() {
                //TODO:
            }

            int Clipboard::init() {
                cout << "call Clipboard::init" << endl;

                flag = 0;
                return flag;
            }

        void Clipboard::clipboardChangeRegistor(ClipboardMonitorCallBackFunc callBackFunc) {
            //TODO:
            cout << "call Clipboard::startClipboardMonitor" << endl;
        }

        ClipboardType Clipboard::getType() {
            //TODO:
            return clipboardData->type;
        }

        unsigned long Clipboard::getHash() {
            //TODO:
            return clipboardData->hash;
        }

        char* Clipboard::getSearchName() {
            //TODO:
            return clipboardData->searchName;
        }

        void* Clipboard::getBufferData() {
            //TODO:
            return clipboardData->bufferData;
        }

        unsigned long Clipboard::getBufferLength() {
            //TODO:
            return clipboardData->bufferLength;
        }

        ClipboardData* Clipboard::getClipboardData() {
            //TODO:
            return clipboardData;
        }

    }   //namespace ccsys_api

} //namespace cclib