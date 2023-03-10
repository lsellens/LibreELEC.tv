# Made by github.com/lsellens

PKG_NAME="nfs-server"
PKG_VERSION="0.0.1"
PKG_ARCH="any"
PKG_DEPENDS_TARGET=""
PKG_SECTION="script"
PKG_SHORTDESC="Addon to create and edit nfsd exports"
PKG_LONGDESC="Addon to create and edit nfsd exports"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="nfs-server"
PKG_ADDON_TYPE="xbmc.python.script"

make_target() {
  : # nothing to do
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/share/kodi/addons/$PKG_NAME/$PKG_ADDON_ID
  cp $PKG_BUILD/addon.xml $INSTALL/usr/share/kodi/addons/$PKG_NAME/$PKG_ADDON_ID/
}

post_install() {
  ADDON_MANIFEST=$INSTALL/usr/share/kodi/system/addon-manifest.xml
  xmlstarlet ed -L --subnode "/addons" -t elem -n "addon" -v "$PKG_ADDON_ID" $ADDON_MANIFEST
}

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID
  cp -PR $PKG_BUILD/* $ADDON_BUILD/$PKG_ADDON_ID
  cp $PKG_DIR/changelog.txt $ADDON_BUILD/$PKG_ADDON_ID
  cp $PKG_DIR/icon/icon.png $ADDON_BUILD/$PKG_ADDON_ID/resources
}
