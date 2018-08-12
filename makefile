UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
	CC = gcc
endif
ifeq ($(UNAME_S),Darwin)
	CC = gcc-7
endif

HEADERS = crc32.h datatypes.h
CFLAGS = -O3 -Wall 
SOURCES = crc32.c netboot_upload.c
OBJECTS = $(SOURCES:.c=.o)
TARGETS = netboot_upload_tool

.PHONY: all clean

all: $(TARGETS)

$(TARGETS) : $(OBJECTS) $(HEADERS)
	$(CC) $(CFLAGS) -o $@ $(OBJECTS)

%.o:%.c
	$(CC) -c $+

clean:
	@rm -rf $(TARGETS) $(OBJECTS)
	
rebuild: clean all
