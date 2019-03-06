//TODO: for test
//COMPILE: g++ `pkg-config --cflags gtk+-3.0` -o ./../../out/main demo.cc `pkg-config --libs gtk+-3.0`
//LINK: https://www.cnblogs.com/silvermagic/p/9087648.html
#include <gtk/gtk.h>
#include <iostream>

using namespace std;

gint on_button_press_event(GtkWidget *widget, GdkEvent *event, gpointer data)
{
    g_return_val_if_fail(widget != NULL, FALSE);
    g_return_val_if_fail(GTK_IS_MENU(data), FALSE);
    g_return_val_if_fail(event != NULL, FALSE);

    if (event->type == GDK_BUTTON_PRESS)
    {
        GdkEventButton *mouse = (GdkEventButton *) event;
        if (mouse->button == GDK_BUTTON_SECONDARY)
        {
            gtk_widget_show_all(GTK_WIDGET(data));
            // gtk_menu_popup_at_pointer(GTK_MENU(data), event);
            gtk_menu_popup(GTK_MENU(data), NULL, NULL, NULL, NULL, mouse->button, mouse->time);
            return TRUE;
        }
    }
    return FALSE;
}

void on_paste(GtkMenuItem *menuitem, gpointer data)
{
    GtkClipboard *clip = gtk_clipboard_get(GDK_SELECTION_CLIPBOARD);
    gchar *text = gtk_clipboard_wait_for_text(clip);
    gtk_label_set_text(GTK_LABEL(data), text);
    cout << "text: " << text << endl;
}

int main()
{
    // GtkWidget *window;

    // cout << "&argc: " << &argc << " &argv: " << &argv << endl;

    // cout << "argc: " << argc << " argv: " << argv << endl;
    gtk_init(NULL, NULL);
    gpointer data = NULL;
    on_paste(NULL, &data);
    cout << "&data: " << &data << endl;
    cout << "data: " << data << endl;
    // GtkClipboard *clip = gtk_clipboard_get(GDK_SELECTION_CLIPBOARD);
    // window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    // gtk_window_set_default_size(GTK_WINDOW(window), 300, 250);
    // GtkWidget *label = gtk_label_new("test");
    // gtk_container_add(GTK_CONTAINER(window), label);

    // GtkWidget *menu = gtk_menu_new();
    // GtkWidget *pasteMi = gtk_menu_item_new_with_label("Paste");
    // gtk_menu_shell_append(GTK_MENU_SHELL(menu), pasteMi);
    // g_signal_connect(G_OBJECT(window), "button-press-event", G_CALLBACK(on_button_press_event), menu);
    // g_signal_connect(G_OBJECT(window), "destroy", G_CALLBACK(gtk_main_quit), NULL);
    // g_signal_connect(G_OBJECT(pasteMi), "activate", G_CALLBACK(on_paste), label);
    // gtk_widget_show_all(window);
    // gtk_main();
    return 0;
}