#include <iostream>

#include "../inc/clipboard_x11.h"

using namespace std;
using namespace cclib::ccsys_api;

int main(int argc, char const *argv[])
{
    /* code */
    GtkWidget *window;
    Clipboard* cc = new ClipboardX11();

    int value = cc->foo();

    cout << value << endl;

    window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    gtk_window_set_default_size(GTK_WINDOW(window), 300, 250);

    gtk_widget_show_all(window);
    gtk_main();

    return 0;
}
