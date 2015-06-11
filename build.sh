#!/bin/bash

set -xe

dpkg-reconfigure qemu-user-static

ubuntu-device-flash core 15.04 \
                    --oem moul-docker \
                    --developer-mode \
                    --enable-ssh \
                    --device-part=/device.tar.xz \
                    -o /dist/snappy.img
