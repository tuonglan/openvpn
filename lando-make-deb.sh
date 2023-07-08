#!/bin/bash

VERSION=$(git describe --tags --abbrev=0)
VERSION="${VERSION:1}"

# Prepare
mkdir -p installation/DEBIAN

# Create config 
echo """Source: openvpn
Section: unknown
Priority: optional
Maintainer: Lan Do <tuonglan7777777@yahoo.com>
Version: ${VERSION}
Rules-Requires-Root: no
Package: openvpn
Architecture: amd64
Depends: libssl-dev, liblzo2-dev, libpam0g-dev, libnl-genl-3-dev, libcap-ng-dev, liblz4-dev
Description: For installing custom-built openvpn
""" > installation/DEBIAN/control

dpkg-deb --build installation openvpn-$VERSION.deb
