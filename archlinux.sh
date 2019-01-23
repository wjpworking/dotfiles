#!/usr/bin/env bash
# 已经在/etc/pacman.conf中加入了archlinuxcn的依赖

# 更新 pacman 的缓存
sudo pacman -Syyu

# 需要下载的软件
sudo pacman -S fcitx-rime archlinuxcn-keyring \
    yarn aria2 emacs bat adobe-source-code-pro-fonts \
    ttf-fira-code python-neovim neovim clang npm
