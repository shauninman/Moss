# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="plymouth-lite"
PKG_VERSION="92b3d5ba65b2ca88d02450380cc499014a4325b4"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/JustEnoughLinuxOS/plymouth-lite"
PKG_URL="${PKG_SITE}.git"
PKG_DEPENDS_INIT="toolchain libpng"
PKG_DEPENDS_TARGET="toolchain libpng"
PKG_LONGDESC="Boot splash screen based on Fedora's Plymouth code"

if [ "${UVESAFB_SUPPORT}" = yes ]; then
  PKG_DEPENDS_INIT="${PKG_DEPENDS_INIT} v86d:init"
fi

pre_configure_init() {
  cd ${PKG_BUILD}
  rm -rf .${TARGET_NAME}-init
}

makeinstall_init() {
  mkdir -p ${INSTALL}/usr/bin
  cp ply-image ${INSTALL}/usr/bin
}

pre_configure_target() {
  cd ${PKG_BUILD}
  rm -rf .${TARGET_NAME}-init
}

