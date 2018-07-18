Qt5 webOS SDK
=============

Requirements
------------
- Linux amd64 PC
- PalmSDK

Source
------
[qt5-webos-sdk](https://gitlab.com/nizovn/qt5-webos-sdk)

Description
-----------
qt5-webos-sdk is a set of tools needed to compile qt5 applications for webOS devices.
It contains linaro cross-compilation toolchain, Qt5 framework libraries and host tools,
necessary libraries for compilation for webOS devices.
Applications compiled using this SDK will have to depend on [com.nizovn.qt5sdk](https://gitlab.com/nizovn/com.nizovn.qt5sdk) package,
which set up required environment in jailer for applications to run properly.
Applications will have to specify "qt5sdk" property in their appinfo.json file.

Installation
------------
This SDK can be installed on Ubuntu/Debian based distrubutions using deb package:

    sudo dpkg -i qt5-webos-sdk_5.9.5-0.deb

Or, on any distrubition by unzipping tar.xz archive into any directory, and adjusting
corresponding paths in qt5/host/bin/qt.conf and QT5\_WEBOS\_PATH variable in
qt5/host/mkspecs/linux-webos-arm-gnueabi-g++/qmake.conf file.

