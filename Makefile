PREFIX?=/usr/local
FIRMDIR?=/lib/firmware
BINDIR?=$(PREFIX)/bin
LIBDIR?=$(PREFIX)/lib


rtk_hciattach:hciattach.c hciattach_rtk.o  
	cc $(CFLAGS) -o rtk_hciattach hciattach.c hciattach_rtk.o  

hciattach_rtk.o:hciattach_rtk.c
	cc $(CFLAGS) -c hciattach_rtk.c

clean:
	rm -f *.o  rtk_hciattach rtkbt.service

rtkbt.service: rtkbt.service.in
	sed -e s:@BINDIR@:$(BINDIR):g rtkbt.service.in >rtkbt.service

# Install
install: rtk_hciattach rtkbt.service
	install -Dm644 -t $(DESTDIR)$(FIRMDIR)/rtl_bt firmware/rtl8723bs_fw.bin firmware/rtl8723bs_config.bin
	install -Dm755 -t $(DESTDIR)$(BINDIR) rtk_hciattach rtkbt.sh start_rtkbt.sh
	install -Dm644 -t $(DESTDIR)$(LIBDIR)/systemd/system rtkbt.service

