How to build Qt
---------------

Download Qt sources (**qt-everywhere-opensource-src-5.9.7.tar.xz**) from [official site](http://download.qt.io/official_releases/qt/5.9/5.9.7/single/) and untar it somewhere.

    mkdir /home/nizovn/webos/qt5/qt5.9
    tar xvf qt-everywhere-opensource-src-5.9.7.tar.xz -C /home/nizovn/webos/qt5/qt5.9

Download and untar gcc cross toolchain (**gcc-linaro-4.8-2015.06-x86\_64\_arm-linux-gnueabi.tar.xz**) from [linaro site](https://releases.linaro.org/archive/15.06/components/toolchain/binaries/4.8/arm-linux-gnueabi/).

    tar xvf gcc-linaro-4.8-2015.06-x86_64_arm-linux-gnueabi.tar.xz -C /home/nizovn/webos/qt5/qt5.9
Copy **files/linux-webos-arm-gnueabi-g++** directory to **qt-everywhere-opensource-src-5.9.7/qtbase/mkspecs**. Edit **QT5\_WEBOS\_PATH** variable in **qmake.conf** to your directory.

Copy libraries and headers required for building Qt.

    cp -Rf files/device /home/nizovn/webos/qt5/qt5.9

Apply required patches.

    patch /home/nizovn/webos/qt5/qt5.9/qt-everywhere-opensource-src-5.9.7/qtwebengine/src/core/config/embedded_linux.pri files/embedded_linux.pri.patch
    patch /home/nizovn/webos/qt5/qt5.9/qt-everywhere-opensource-src-5.9.7/qtbase/src/corelib/kernel/qcoreapplication.cpp files/qcoreapplication.cpp.patch
    patch /home/nizovn/webos/qt5/qt5.9/qt-everywhere-opensource-src-5.9.7/qtbase/src/corelib/io/qstandardpaths_unix.cpp files/qstandardpaths_unix.cpp.patch
    patch /home/nizovn/webos/qt5/qt5.9/qt-everywhere-opensource-src-5.9.7/qtbase/src/gui/opengl/qopengles2ext.h files/qopengles2ext.h.patch
    patch /home/nizovn/webos/qt5/qt5.9/qt-everywhere-opensource-src-5.9.7/qtbase/src/network/ssl/qsslsocket_openssl.cpp files/qsslsocket_openssl.cpp.patch
    patch /home/nizovn/webos/qt5/qt5.9/qt-everywhere-opensource-src-5.9.7/qtbase/src/gui/opengl/qopengltextureglyphcache.cpp files/qopengltextureglyphcache.cpp.patch

Copy configure script (adjust build directory path) into Qt directory and execute it.

    cp files/configurePalmHD.5.9.sh /home/nizovn/webos/qt5/qt5.9/qt-everywhere-opensource-src-5.9.7
    cd /home/nizovn/webos/qt5/qt5.9/qt-everywhere-opensource-src-5.9.7
    ./configurePalmHD.5.9.sh

Build Qt.

    make -j8
    make install

    cd qtvirtualkeyboard
    make distclean
    /home/nizovn/webos/qt5/qt5.9/runtime/host/bin/qmake "CONFIG+=lang-all"
    make -j8
    make install

