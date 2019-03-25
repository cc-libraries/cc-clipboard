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

#ifndef CCLIB_CCSYS_API_CLIPBOARD_H_
#define CCLIB_CCSYS_API_CLIPBOARD_H_

#include <iostream>

#include "base/os.h"
#include "base/clipboard_define.h"
#include "base/common_define.h"

using namespace std;

namespace cclib {

    namespace ccsys_api {

        class Clipboard {
            public:
                Clipboard();
                virtual ~Clipboard();

            public:
                typedef void (* ClipboardMonitorCallBackFunc) ();

            public:
                int init();
                virtual int foo() = 0;
                virtual void clipboardChangeRegistor(ClipboardMonitorCallBackFunc callBackFunc);
                //NOTICE: atomic operate
                virtual ClipboardType getType();
                virtual unsigned long getHash();
                virtual char* getSearchName();
                virtual void* getBufferData();
                virtual unsigned long getBufferLength();
                virtual ClipboardData* getClipboardData();

            protected:
                //NOTICE: atomic operate
                ClipboardData* clipboardData;
                int flag;
        }; //class clipboard

    }   //namespace ccsys

} //namespace cclib

#endif  // CCLIB_CCSYS_API_CLIPBOARD_H_