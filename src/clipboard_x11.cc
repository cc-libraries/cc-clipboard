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
            init();
        }

        ClipboardX11::~ClipboardX11() {
            //TODO: ClipboardX11
        }

        int ClipboardX11::init() {
            gtk_init(NULL, NULL);

            cout << "GDK_SELECTION_CLIPBOARD: " << GDK_SELECTION_CLIPBOARD << endl;

            GtkClipboard* gtkClipboardInstance = gtk_clipboard_get(GDK_SELECTION_CLIPBOARD);

            cout << "gtkClipboardInstance1: " << gtkClipboardInstance << endl;

            int retValue = g_signal_connect (gtkClipboardInstance, "owner-change", G_CALLBACK (&ClipboardX11::foo), NULL);

            cout << "ClipboardX11 retValue: " << retValue << endl;
        }

        int ClipboardX11::foo() {
            cout << "foo value: " << flag << endl;

            return flag;
        }

    }   //namespace ccsys_api

}   //namespace cclib