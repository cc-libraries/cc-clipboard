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

#ifndef CCLIB_CCSYS_API_CLIPBOARD_X11_H_
#define CCLIB_CCSYS_API_CLIPBOARD_X11_H_

#include <gtk/gtk.h>
#include <gtk/gtkclipboard.h>
#include <gtk/gtkselection.h>

#include "clipboard.h"

namespace cclib {

    namespace ccsys_api {

        class ClipboardX11 : public Clipboard {

            public:
                ClipboardX11();
                ~ClipboardX11();

            public:
                int init();
                int foo();
        };  //class ClipboardX11

    }   //namespace ccsys

}   //namespace cclib

#endif  //CCLIB_CCSYS_API_CLIPBOARD_X11_H_