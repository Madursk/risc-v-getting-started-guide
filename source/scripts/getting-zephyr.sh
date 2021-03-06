#!/bin/bash

set -e

# install prerequisites
sudo apt-get install --no-install-recommends git cmake ninja-build gperf \
  ccache dfu-util device-tree-compiler wget python3-pip python3-setuptools \
  python3-wheel xz-utils file make gcc gcc-multilib
# /install prerequisites

# download Zephyr
git clone https://github.com/zephyrproject-rtos/zephyr
cd zephyr
pip3 install --user -r scripts/requirements.txt
# /download Zephyr

# set up env
export ZEPHYR_TOOLCHAIN_VARIANT=zephyr
export ZEPHYR_SDK_INSTALL_DIR="/opt/zephyr-sdk/"
export ZEPHYR_SDK_VERSION="0.10.3"
. ./zephyr-env.sh
# /set up env

# install Zephyr SDK
wget https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v$ZEPHYR_SDK_VERSION/zephyr-sdk-$ZEPHYR_SDK_VERSION-setup.run
sudo sh zephyr-sdk-$ZEPHYR_SDK_VERSION-setup.run -- -d $ZEPHYR_SDK_INSTALL_DIR
# /install Zephyr SDK
