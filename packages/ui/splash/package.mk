# SPDX-License-Identifier: Apache-2.0
# Copyright (C) 2020-present Fewtarius

PKG_NAME="splash"
PKG_VERSION="$(date +%Y%m%d)"
PKG_ARCH="any"
PKG_LICENSE="apache2"
PKG_SITE=""
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Boot splash screens"
PKG_TOOLCHAIN="manual"

make_init() {
  :
}

make_target() {
  :
}

mksplash() {
  SPLASH="${PKG_DIR}/splash.png"
  cp ${SPLASH} ${1}
}

makeinstall_init() {
  mkdir -p ${INSTALL}/splash
  mksplash ${INSTALL}/splash
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/config/splash
  mksplash ${INSTALL}/usr/config/splash
}
