MY_WEBOS_FOLDER=/home/herrie/webos
QT_FOLDER_PREFIX=qt
QT_VERSION_MAJOR=5
QT_VERSION_MINOR=9
QT_VERSION_PATCH=7

SYSROOT_PKG=$MY_WEBOS_FOLDER/$QT_FOLDER_PREFIX$QT_VERSION_MAJOR/$QT_FOLDER_PREFIX$QT_VERSION_MAJOR.$QT_VERSION_MINOR/device/sysroot
export PKG_CONFIG_LIBDIR=$SYSROOT_PKG/usr/lib/pkgconfig
export PKG_CONFIG_SYSROOT_DIR=$SYSROOT_PKG

#Needed to prevent OOM error while building QTWebEngine, adjust value based on number of available cores
export NINAJAFLAGS=-j16

MY_PREFIX=$MY_WEBOS_FOLDER/$QT_FOLDER_PREFIX$QT_VERSION_MAJOR/$QT_FOLDER_PREFIX$QT_VERSION_MAJOR.$QT_VERSION_MINOR/runtime
WEBOS_PREFIX=/media/cryptofs/apps/usr/palm/applications/com.nizovn.qt5

#disabled openssl-linked below for now, since this doesn't seem to work

# -openssl-linked
./configure \
-no-gcc-sysroot \
-sysroot ${SYSROOT_PKG} \
-prefix ${WEBOS_PREFIX} \
-extprefix ${MY_PREFIX} \
-hostprefix ${MY_PREFIX}/host \
-opensource \
-confirm-license \
-qt-freetype \
-openssl \
-feature-accessibility \
-accessibility \
-skip qtandroidextras -skip qtactiveqt -skip qtdoc  \
-skip qtserialport  -skip qtwayland \
-skip qtmacextras -skip qtlocation \
-skip qtx11extras -skip qtwinextras \
-skip qttools \
-skip qtenginio -skip qtactiveqt \
-qt-pcre \
-release \
-no-cups \
-no-dbus \
-no-sm \
-no-pch \
-no-glib \
-no-harfbuzz \
-no-qml-debug \
-no-gstreamer \
-no-xkbcommon-evdev \
-no-xcb \
-no-xkbcommon-evdev \
-no-kms \
-no-system-proxies  \
-no-journald  \
-no-mtdev  \
-no-separate-debug-info \
-reduce-exports \
-no-android-style-assets \
-no-compile-examples \
-nomake examples -nomake tests \
-make tools \
-platform linux-g++ \
-make libs \
-xplatform linux-webos-arm-gnueabi-g++ \
-no-evdev \
-no-rpath \
-force-pkg-config \
-eglfs \
-alsa \
-proprietary-codecs \
-pepper-plugins \
-printing-and-pdf \
-webrtc \
-qpa webos \
-opengl es2
