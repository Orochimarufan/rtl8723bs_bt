# RTL8723BS Bluetooth
Realtek UART HCI Bluetooth driver

**This is essentially [sorhtyre/rtl8723bs_bt](https://github.com/sorhtyre/rtl8723bs_bt) branch [8b5a1cd6](https://github.com/sorhtyre/rtl8723bs_bt/tree/8b5a1cd6) with old TTY selection.**

Tested on:
- Chuwi Hi10 Plus

The BayTrail UART HCI drivers require patches under the 4.9 Linux kernel.

Ensure Kernel is built to support GPIO RFKILL driver, support for Synopsys
DesignWare 8250 quirks, and HCI UART driver with three-wire UART (H5)
protocol support.

- CONFIG_RFKILL_GPIO=m
- CONFIG_SERIAL_8250_DW=m
- CONFIG_BT_HCIUART=m
- CONFIG_BT_HCIUART_3WIRE=y

**I use kernel compiled from [danielotero/linux-on-hi10](https://github.com/danielotero/linux-on-hi10), which already has these lines.**

### Patches
Verified against Linux kernel 4.9.13
Current dirver includes required patches:
- patches/
  - 0001-Add-Realtek-RTL8723BS-Bluetooth-to-rfkill-gpio.patch

**I didn't apply this patch.**

### Firmware
Verified against Linux kernel 4.9.13
Current dirver includes required firmwares:
- firmware/
  - rtl8723bs_config.bin
  - rtl8723bs_fw.bin


### Install
```
 make
 sudo make install
 sudo cp ./system.d/. /etc/systemd/system
 systemctl enable rtk_bt.service
 sudo modprobe btusb
 systemctl enable bluetooth.service
 ```
