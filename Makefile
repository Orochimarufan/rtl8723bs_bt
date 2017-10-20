PREFIX?=/usr/local
FIRMDIR?=/lib/firmware
BINDIR?=$(PREFIX)/bin


rtk_hciattach:hciattach.c hciattach_rtk.o  
	cc $(CFLAGS) -o rtk_hciattach hciattach.c hciattach_rtk.o  

hciattach_rtk.o:hciattach_rtk.c
	cc $(CFLAGS) -c hciattach_rtk.c

clean:
	rm -f *.o  rtk_hciattach


# Install
install:
	install -Dm644 -t $(DESTDIR)$(FIRMDIR)/rtl_bt firmware/rtl8723bs_fw.bin firmware/rtl8723bs_config.bin
	install -Dm755 -t $(DESTDIR)$(BINDIR) rtk_hciattach start_rtkbt.sh

