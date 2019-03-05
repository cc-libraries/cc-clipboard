CC = g++
PRO_DIR = ../..
INC_DIR = $(PRO_DIR)/inc
SRC_DIR = $(PRO_DIR)/src
OUT_DIR = $(PRO_DIR)/out
TEST_DIR = $(PRO_DIR)/test
# OUT_OBJ_DIR = $(OUT_DIR)/obj
X11_SRC = $(SRC_DIR)/clipboard_x11.cc
SRC = $(SRC_DIR)/clipboard.cc
GTK_CFLAGS = `pkg-config --cflags gtk+-3.0`
GTK_LIB = `pkg-config --libs gtk+-3.0`
CFLAGS = $(GTK_CFLAGS) -shared -fPIC
TARGET = $(OUT_DIR)/libclipboard.so
OBJS = $(OUT_DIR)/clipboard.o
OBJS_X11 = $(OUT_DIR)/clipboard_x11.o
# OBJS_MAC =  clipboard_mac.o

${TARGET}:
	$(CC) $(CFLAGS) -o $(TARGET) $(X11_SRC) $(SRC) $(GTK_LIB)
$(OBJS_X11):%.o:$(SRC_DIR)/clipboard_x11.cc
	$(CC) -c $(CFLAGS) $< -o $@
$(OBJS):%.o:$(SRC_DIR)/clipboard.cc
	$(CC) -c $(CFLAGS) $< -o $@
# $(OBJS_MAC):%.o:$(SRC_DIR)/%.mm
# 	$(CC) -c $(CFLAGS) $< -o $@

clean:
	rm -rf $(OUT_DIR)/*

test:
	$(OUT_DIR)/test_x11

export_lib:
	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$(OUT_DIR)

dynamic_test:
	$(CC) $(GTK_CFLAGS) -o $(OUT_DIR)/test_x11 $(TEST_DIR)/test_x11.cc -L$(OUT_DIR) -lclipboard $(GTK_LIB)