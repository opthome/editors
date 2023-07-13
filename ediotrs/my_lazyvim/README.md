# 安装
```shell
# 使用 lua 时，lua_language_server 内存很高，尤其是对 lazyvim 中的文件进行编写时

# https://www.lazyvim.org

# required
mv ~/.config/nvim ~/.config/nvim.bak
# optional but recommended
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak

git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# 启动后，自动安装插件
nvim
# 我的配置
# 只是修改了 lua/config/options.lua，其他不变

# 遇到安装错误时
npm cache clear --force
npm config set registry https://registry.npmjs.org/
```
## 介绍
### lazyvim
```python
# 启动 nvim 自动安装插件

#  Requirements
# Neovim >= 0.8.0 (needs to be built with LuaJIT)
# Git >= 2.19.0 (for partial clones support)
# a Nerd Font (optional)
# lazygit (optional)
# for telescope.nvim (optional)
	# live grep: ripgrep
	# find files: fd
# a terminal that support true color and undercurl:
# kitty (Linux & Macos)
# wezterm (Linux, Macos & Windows)
# alacritty (Linux, Macos & Windows)
# iterm2 (Macos)

# 常用的插件 LazyVim 已经全部安装

# LSP
# 使用 mason 安装对应的 language-server 即可
# 其中的大部分文件都不需要动，极少的配置（lua文件夹下）已放在GitHub上备份
```
### 安装新插件
```lua
-- 安装新插件
-- 在 plugins 下新建文件，随便叫啥
--  在文件内添加插件

-- 格式:
-- 可在一个 return 中添加多个插件，每个插件用 {}
-- return { 'plugin_name', 'other settings', config = function() require("...").setup() end, }
return {
	'akinsho/bufferline.nvim',
	 version = "*", 
	 dependencies = 'nvim-tree/nvim-web-devicons',
	 config = function()
		 require("lualine").setup({...})
	end,
}

-- 打开 nvim 自动进行安装

-- 如果没有安装成功，手动执行 shell 脚本
-- ~/.local/share/nvim/...
```
### 结构
```shell
.
├── LICENSE
├── README.md
├── init.lua
├── lazy-lock.json
├── lua
│   ├── config
│   │   ├── autocmds.lua    # 启动时，自动执行的命令
│   │   ├── keymaps.lua     # 键盘映射
│   │   ├── lazy.lua
│   │   └── options.lua     # 自己需要修改、添加的配置
│   └── plugins
│       └── example.lua     # 添加插件示例文件
└── stylua.toml
```
## 默认配置
```shell
# https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/
```