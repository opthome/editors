# 介绍
```shell
# https://github.com/kovidgoyal/kitty
# https://sw.kovidgoyal.net/kitty/

# 配置文件
# ～/.config/kitty/kitty.conf
# 显示配置文件地址
kitty -h

# 生成默认配置文件
kitty +runpy 'from kitty.config import *; print(commented_out_default_config())'
```
# 命令
```shell
kitty +list-fonts   # 显示可用字体
```
# 主题
```shell
# 方式一
# https://github.com/dexpota/kitty-themes
git clone --depth 1 https://github.com/dexpota/kitty-themes.git ~/.config/kitty/kitty-themes

cd ~/.config/kitty
ln -s ./kitty-themes/themes/Floraverse.conf ~/.config/kitty/theme.conf

# kitty.conf
include ./theme.conf

# 主题推荐
# 可修改里面的配色方案
# JetBrains Darcula
# FrontEndDelight.conf
	# 已修改配色
	# color8 #565746
	# color2 #74eb4c
	# color10 #9AFF9A

# 方式二
# 在 iterm2 下载的主题中，有各种终端的主题样式，可直接使用
# https://iterm2colorschemes.com
# GitHub Dark

```