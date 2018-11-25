#!/usr/bin/env bash
# 已经在/etc/pacman.conf中加入了archlinuxcn的依赖

sudo pacman -S base base-devel fcitx-rime kcm-fcitx qbittorrent \
    manjaro-aur-support archlinux-keyring google-chrome \
    yarn aria2 jdk8 emacs bat adobe-source-code-pro-fonts \
    ttf-fira-code python-neovim neovim
