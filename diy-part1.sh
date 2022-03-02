#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

sed -i 's/KERNEL_PATCHVER:=5.15/KERNEL_PATCHVER:=5.10/g' target/linux/x86/Makefile

sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default

# Add a feed source
packages=(
    https://github.com/esirplayground/luci-app-poweroff
    https://github.com/rufengsuixing/luci-app-onliner
)
mkdir -p package/3rdparty
for package in ${packages[@]}
do
    echo "syncing $package"
    name=$(echo $package | awk -F '/' '{print $NF}')
    git clone $package package/3rdparty/$name
done
