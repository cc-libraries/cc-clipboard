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

#ifndef CCLIB_CLIPBOARD_X11_H_
#define CCLIB_CLIPBOARD_X11_H_

#include "clipboard.h"

namespace cclib {

class ClipboardX11 : public Clipboard {

    public:
        ClipboardX11();
        ~ClipboardX11();

    public:
        size_t foo();
};  //class ClipboardX11

}   //namespace cclib

#endif  //CCLIB_CLIPBOARD_X11_H_