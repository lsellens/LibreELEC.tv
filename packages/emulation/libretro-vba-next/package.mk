# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libretro-vba-next"
PKG_VERSION="110ab08"
PKG_SHA256="bd38e3b23287d654b622e6ddbf3d2829e07e07cb67295ef1be17ed1d9a70b5c0"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/vba-next"
PKG_URL="https://github.com/libretro/vba-next/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="vba-next-$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain kodi-platform"
PKG_SECTION="emulation"
PKG_SHORTDESC="game.libretro.vba-next: VBA-Next for Kodi"
PKG_LONGDESC="game.libretro.vba-next: VBA-Next for Kodi"

PKG_LIBNAME="vba_next_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"
PKG_LIBVAR="VBA-NEXT_LIB"

make_target() {
  make -f Makefile.libretro
}

makeinstall_target() {
  mkdir -p $SYSROOT_PREFIX/usr/lib/cmake/$PKG_NAME
  cp $PKG_LIBPATH $SYSROOT_PREFIX/usr/lib/$PKG_LIBNAME
  echo "set($PKG_LIBVAR $SYSROOT_PREFIX/usr/lib/$PKG_LIBNAME)" > $SYSROOT_PREFIX/usr/lib/cmake/$PKG_NAME/$PKG_NAME-config.cmake
}