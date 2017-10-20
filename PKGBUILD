# Maintainer: Taeyeon Mori <orochimarufan.x3@gmail.com>
# This is mostly a quick hack as it doesn't actually download stuff from anywhere.
pkgname=rtl8723bs_bt-hi10
_pkgver=2.2
pkgver=2.2+bf81f37
pkgrel=1

pkgdesc="rtk_hciattach utility and firmware for RTL8723BS Bluetooth module"
arch=("i686" "x86_64")
url="https://github.com/yiping-huang/rtl8723bs_bt"
license=('GPL')

optdepends=(bluez)


pkgver() {
    cd "$startdir"
    printf "%s+%s" "$_pkgver" "`git rev-parse --short HEAD`"
}


build() {
    cd "$startdir"

    make PREFIX=/usr FIRMDIR=/usr/lib/firmware
}

package() {
    cd "$startdir"
    make PREFIX=/usr FIRMDIR=/usr/lib/firmware DESTDIR="$pkgdir/" install
}

