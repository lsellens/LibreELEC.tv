PKG_NAME="transmission"
PKG_VERSION="4.0.1"
PKG_SHA256="8fc5aef23638c983406f6a3ee9918369e4cdc84e3228bd2fb3d01dd55cdad900"
PKG_REV="25"
PKG_LICENSE="OSS"
PKG_SITE="http://www.transmissionbt.com/"
PKG_URL="https://github.com/transmission/transmission/releases/download/${PKG_VERSION}/${PKG_NAME}-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain curl libevent"
PKG_TOOLCHAIN="cmake-make"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Transmission"
PKG_ADDON_TYPE="xbmc.service"
PKG_SECTION="service"
PKG_SHORTDESC="${PKG_ADDON_NAME}: a fast, easy and free BitTorrent client"
PKG_LONGDESC="${PKG_ADDON_NAME} (${PKG_VERSION}) is a fast, easy and free BitTorrent client."
PKG_MAINTAINER="lsellens"

PKG_CMAKE_OPTS_TARGET="-DENABLE_DAEMON=ON \
                       -DENABLE_GTK=OFF \
                       -DENABLE_QT=OFF \
                       -DENABLE_MAC=OFF \
                       -DENABLE_UTILS=On \
                       -DENABLE_CLI=OFF \
                       -DENABLE_TESTS=OFF \
                       -DENABLE_LIGHTWEIGHT=OFF \
                       -DENABLE_UTP=ON \
                       -DENABLE_NLS=OFF \
                       -DINSTALL_DOC=OFF \
                       -DINSTALL_LIB=OFF \
                       -DUSE_SYSTEM_EVENT2=ON \
                       -DUSE_SYSTEM_DHT=OFF \
                       -DUSE_SYSTEM_MINIUPNPC=OFF \
                       -DUSE_SYSTEM_NATPMP=OFF \
                       -DUSE_SYSTEM_UTP=OFF \
                       -DUSE_SYSTEM_B64=OFF \
                       -DWITH_CRYPTO=openssl \
                       -DWITH_SYSTEMD=OFF"

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}
    rm ${PKG_BUILD}/.install_pkg/usr/bin/transmission-edit \
       ${PKG_BUILD}/.install_pkg/usr/bin/transmission-create \
       ${PKG_BUILD}/.install_pkg/usr/bin/transmission-show
    cp -PR ${PKG_BUILD}/.install_pkg/usr/bin \
           ${PKG_BUILD}/.install_pkg/usr/share/transmission/public_html \
           ${ADDON_BUILD}/${PKG_ADDON_ID}
}

