# RTL8723BS Bluetooth
Realtek UART HCI Bluetooth driver

This is essentially [sorhtyre/rtl8723bs_bt](https://github.com/sorhtyre/rtl8723bs_bt) branch [8b5a1cd6](https://github.com/sorhtyre/rtl8723bs_bt/tree/8b5a1cd6) with modified scripts and systemd service

Tested on:
- Chuwi Hi10 Pro

The BayTrail UART HCI drivers require patches under the 4.9 Linux kernel.

Ensure Kernel is built to support GPIO RFKILL driver, support for Synopsys
DesignWare 8250 quirks, and HCI UART driver with three-wire UART (H5)
protocol support.

- CONFIG_RFKILL_GPIO=m
- CONFIG_SERIAL_8250_DW=m
- CONFIG_BT_HCIUART=m
- CONFIG_BT_HCIUART_3WIRE=y

I use kernel compiled from [danielotero/linux-on-hi10](https://github.com/danielotero/linux-on-hi10), which already has these lines.

I don't use any additional kernel patches

### Firmware
Verified against Linux kernel 4.9.13
Current dirver includes required firmwares:
- firmware/
  - rtl8723bs_config.bin
  - rtl8723bs_fw.bin


### Install
#### Arch:
```
$ cd <repo root>
$ makepkg -i
$ sudo systemctl enable --now bluetooth rtkbt
 ```
 
#### Other:
```
$ cd <repo root>
$ make
$ sudo make install
$ sudo systemctl enable --now bluetooth rtkbt
```
See the top of Makefile for the available install options
