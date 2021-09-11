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

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

echo "src-git helloworld https://github.com/fw876/helloworld.git" >> feeds.conf.default
packages=(
    https://github.com/toss-a/luci-theme-atmaterial
    https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom
    https://github.com/aboutboy/luci-theme-butongwifi
    https://github.com/tty228/luci-app-serverchan
    https://github.com/rufengsuixing/luci-app-adguardhome
    https://github.com/jefferymvp/luci-app-koolproxyR
    https://github.com/project-lede/luci-app-godproxy
    https://github.com/destan19/OpenAppFilter
    https://github.com/zzsj0928/luci-app-pushbot
    https://github.com/jerrykuku/luci-app-ttnode
    https://github.com/lisaac/luci-app-dockerman
    https://github.com/lisaac/luci-app-diskman
    https://github.com/jerrykuku/lua-maxminddb
    https://github.com/jerrykuku/luci-app-vssr
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
