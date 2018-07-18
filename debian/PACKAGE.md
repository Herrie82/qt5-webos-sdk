How to build deb package
-------------------------

    mkdir -p qt5-webos-sdk_5.9.5-0/opt/qt5-webos-sdk/qt5
    mkdir -p qt5-webos-sdk_5.9.5-0/usr/local/bin
    mkdir -p qt5-webos-sdk_5.9.5-0/DEBIAN
    cd qt5-webos-sdk_5.9.5-0/
    tar xvf gcc-linaro-4.8-2015.06-x86_64_arm-linux-gnueabi.tar.xz -C opt/qt5-webos-sdk/
    cp -r /home/nizovn/webos/qt5/qt5.9/runtime/* opt/qt5-webos-sdk/qt5/
    cp -r ../files/device opt/qt5-webos-sdk/
    cp ../debian/qmake-webos usr/local/bin/
    cp ../debian/qt.conf opt/qt5-webos-sdk/qt5/host/bin/
    cp ../debian/control DEBIAN/

    find . -type f ! -regex '.*?DEBIAN.*' -printf '%P ' | xargs md5sum > DEBIAN/md5sums
    cd ..
    dpkg-deb --build qt5-webos-sdk_5.9.5-0

How to create tar.gz release archive
------------------------------------

    mkdir -p qt5-webos-sdk_5.9.5-0/qt5
    cd qt5-webos-sdk_5.9.5-0/
    tar xvf gcc-linaro-4.8-2015.06-x86_64_arm-linux-gnueabi.tar.xz -C .
    cp -r /home/nizovn/webos/qt5/qt5.9/runtime/* qt5/
    cp -r ../files/device .
    cp ../debian/qt.conf qt5/host/bin/
    cp ../README.md .

    cd ..
    tar cJvf qt5-webos-sdk_5.9.5-0.tar.xz qt5-webos-sdk_5.9.5-0/
