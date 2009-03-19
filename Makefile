CC := gcc
CFLAGS := -g -Wall -I.
LDLIBS := -lgcrypt -lpcap

#------------------------------------
all: njit-client


#------------------------------------
njit-client: main.o fillmd5.o fillbase64.o
	$(LINK.o) $^ $(LDLIBS) -o $@
%.o: %.c %.h
	$(COMPILE.c) $< -o $@
%.o: %.c
	$(COMPILE.c) $< -o $@

#------------------------------------
# 可以使用make build.log收集编译信息
build.log: njit-client
	@echo "Build Date: " `date` > $@
	@echo "C Compiler: " `$(CC) --version | head -n 1`>> $@
	@echo "CFLAGS:     " $(CFLAGS) >> $@
	@echo "LDLIBS:     " $(LDLIBS) >> $@

