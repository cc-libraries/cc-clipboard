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

#include "../inc/clipboard_x11.h"

namespace cclib {

    namespace ccsys_api {

        ClipboardX11::ClipboardX11() {
            //TODO: ClipboardX11
            GtkClipboard* gtkClipboardInstance = gtk_clipboard_get(GDK_SELECTION_CLIPBOARD);

            int retValue = g_signal_connect (gtkClipboardInstance, "owner-change", G_CALLBACK (foo()), NULL);

            cout << "ClipboardX11 retValue: " << retValue << endl;
        }
        ClipboardX11::~ClipboardX11() {
            //TODO: ClipboardX11
        }

        int ClipboardX11::foo() {
            int value = flag;

            cout << "foo value: " << value << endl;

            return value;
        }

    }   //namespace ccsys_api

}   //namespace cclib