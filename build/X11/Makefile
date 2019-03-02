CC = g++
PRO_DIR = ../..
INC_DIR = $(PRO_DIR)/inc
SRC_DIR = $(PRO_DIR)/src
OUT_DIR = $(PRO_DIR)/out
TEST_DIR = $(PRO_DIR)/test
# OUT_OBJ_DIR = $(OUT_DIR)/obj
X11_SRC = $(SRC_DIR)/clipboard_x11.cc
SRC = $(SRC_DIR)/clipboard.cc
CFLAGS = -shared -fPIC 
TARGET = $(OUT_DIR)/libclipboard.so
OBJS = $(OUT_DIR)/clipboard.o
OBJS_X11 = $(OUT_DIR)/clipboard_x11.o
# OBJS_MAC =  clipboard_mac.o

${TARGET}:
	$(CC) $(CFLAGS) -o $(TARGET) $(X11_SRC) $(SRC)
$(OBJS_X11):%.o:$(SRC_DIR)/clipboard_x11.cc
	$(CC) -c $(CFLAGS) $< -o $@
$(OBJS):%.o:$(SRC_DIR)/clipboard.cc
	$(CC) -c $(CFLAGS) $< -o $@
# $(OBJS_MAC):%.o:$(SRC_DIR)/%.mm
# 	$(CC) -c $(CFLAGS) $< -o $@

clean:
	rm -rf $(OUT_DIR)/*

test:
	$(OUT_DIR)/test

export_lib:
	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$(OUT_DIR)

dynamic_test:
	$(CC) -o $(OUT_DIR)/test $(TEST_DIR)/test.cc -L$(OUT_DIR) -lclipboard