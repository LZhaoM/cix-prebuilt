#!/usr/bin/env bash

fakeroot bash -c '
    DEB="chromium_128.0.6613.84-1.deb12u1_arm64.deb"
    rm -rf tmp
    mkdir tmp
    dpkg-deb -R $DEB tmp
    sed -Ei "/Provides/ s/$/, chromium-cix/" tmp/DEBIAN/control
    dpkg-deb -b tmp ${DEB/.deb}-fixed.deb
'
