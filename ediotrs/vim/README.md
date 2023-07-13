# vimrc
```shell
# vim 的配置文件：～/.vimrc

# 插件位置：~/.vim/plugged/
# 配色方案：~/.vim/colors/
# vim-plug位置：~/.vim/autoload/
```
# 我的配置
```shell
# 基本设置和键盘映射无需特殊配置

# 插件
# 安装 vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# 安装插件
call plug#begin()
# theme
Plug 'morhetz/gruvbox'
# code
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

# 配置完即可使用
```