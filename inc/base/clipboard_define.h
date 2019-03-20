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

#ifndef CCLIB_CCSYS_API_CLIPBOARD_DEFINE_H
#define CCLIB_CCSYS_API_CLIPBOARD_DEFINE_H

namespace cclib {

    namespace ccsys_api {

        enum ClipboardType {
            /* type */
            EN_CB_NONE,
            EN_CB_TEXT,
            EN_CB_FILES
        };  //ClipboardType

        struct ClipboardData
        {
            /* data */
            ClipboardType type;
            int length;
            void* data;
        };  //ClipboardData

    }   //ccsys_api

}   //cclib

#endif //CCLIB_CCSYS_API_CLIPBOARD_DEFINE_H