# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present Shanti Gilbert (https://github.com/shantigilbert)
# Copyright (C) 2020-present Fewtarius

PKG_NAME="minui"
PKG_VERSION="$(date +%Y%m%d)"
PKG_ARCH="any"
PKG_LICENSE=""
PKG_SITE=""
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain splash plymouth-lite SDL SDL_image SDL_ttf SDL2 SDL2_image SDL2_ttf wireplumber librga"
PKG_LONGDESC="integrated launcher and frontend"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/bin
  cp ${PKG_DIR}/sources/start_minui.sh ${INSTALL}/usr/bin
  chmod 0755 ${INSTALL}/usr/bin/start_minui.sh
  
  mkdir -p ${INSTALL}/usr/share/minui
  cp -rf ${PKG_DIR}/sources/*.png ${INSTALL}/usr/share/minui
}