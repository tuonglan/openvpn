#!/bin/sh

# Install missing library
sudo apt-get update
sudo apt-get install libssl-dev liblzo2-dev libpam0g-dev libnl-genl-3-dev libcap-ng-dev liblz4-dev

# Resolve missing automake files
autoreconf -i

# Run the config
mkdir -p installation
./configure --prefix $(pwd)/installation
make
make install