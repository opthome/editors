# 美化
```shell
# 可以将配置文件导出，需要时直接导入即可
```
## 终端主题
```shell
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme" 

vim ~/.zshrc
ZSH_THEME="spaceship"
source ~/.zshrc
```
## 配色
```shell
git clone https://github.com/dracula/iterm.git
# 在iterm2 中进行导入即可使用

# https://iterm2colorschemes.com
# GitHub Dark
# Tokyonight
```
## 字体
```shell
# profiles -> text 

# 当终端中使用图像文字时
# 例如：vim/nvim 等有图标
# 勾选：use a different font for non-ASCII text
# 下面选择补丁字体

# 修改字体粗细
# use thin strokes for anti-aliased text  ->  never
# 上面的 Italic text 会让一些字体变斜
```
## 快捷键
```shell
C-a  # 开头 
C-e  # 结尾
C-u  # 清除当前行
```

