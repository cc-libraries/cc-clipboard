CC = g++
PRO_DIR = ../../
INC_DIR = $(PRO_DIR)/inc
SRC_DIR = $(PRO_DIR)/src
CFLAGS = -g -I $(PRO_DIR)/inc
TARGET = main
OBJS = clipboard.o
OBJS_X11 = clipboard_x11.o
# OBJS_MAC =  clipboard_mac.o

${TARGET}:${OBJS_X11} ${OBJS}
	$(CC) -o $(TARGET) $(OBJS_X11) $(CFLAGS)
$(OBJS_X11):%.o:$(SRC_DIR)/clipboard_x11.cc
	$(CC) -c $(CFLAGS) $< -o $@
 $(OBJS):%.o:$(SRC_DIR)/clipboard.cc
	$(CC) -c $(CFLAGS) $< -o $@
# $(OBJS_MAC):%.o:$(SRC_DIR)/%.mm
# 	$(CC) -c $(CFLAGS) $< -o $@

clean:
	rm -rf $(TARGET) *.o