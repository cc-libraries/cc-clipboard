CC = g++
PRO_DIR = ../..
INC_DIR = $(PRO_DIR)/inc
SRC_DIR = $(PRO_DIR)/src
OUT_DIR = $(PRO_DIR)/out
TEST_DIR = $(PRO_DIR)/test
# OUT_OBJ_DIR = $(OUT_DIR)/obj
MAC_SRC = $(SRC_DIR)/clipboard_mac.mm
SRC = $(SRC_DIR)/clipboard.cc
MAC_CFLAGS = -framework AppKit -framework Foundation
CFLAGS = $(MAC_CFLAGS) -shared -fPIC
TARGET = $(OUT_DIR)/libclipboard.so
OBJS = $(OUT_DIR)/clipboard.o
OBJS_MAC = $(OUT_DIR)/clipboard_mac.o
# OBJS_MAC =  clipboard_mac.o

${TARGET}:
	$(CC) $(CFLAGS) -o $(TARGET) $(MAC_SRC) $(SRC)
$(OBJS_MAC):%.o:$(SRC_DIR)/clipboard_mac.mm
	$(CC) -c $(CFLAGS) $< -o $@
$(OBJS):%.o:$(SRC_DIR)/clipboard.cc
	$(CC) -c $(CFLAGS) $< -o $@
# $(OBJS_MAC):%.o:$(SRC_DIR)/%.mm
# 	$(CC) -c $(CFLAGS) $< -o $@

clean:
	rm -rf $(OUT_DIR)/*

test:
	$(OUT_DIR)/test_mac

dltest:
	$(CC) $(MAC_CFLAGS) -o $(OUT_DIR)/test_mac $(TEST_DIR)/test_mac.mm -L$(OUT_DIR) -lclipboard