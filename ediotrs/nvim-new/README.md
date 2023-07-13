# 基础
## 安装我的配置
```python
1、(环境为mac)将配置文件clone 放到 ~/.config/nvim
2、安装packer.nvim (https://github.com/wbthomason/packer.nvim)
3、执行 :PackerSync 进行安装插件
4、安装对应语言的 language-server、debug 环境、插件需要的依赖
5、修改
	将文件中有具体路径的地方进行修改
	nvim-tree 需要安装补丁字体
	ranger 需要额外的包
	telescope 安装额外包

# 需要安装多个配置时
# .zprofile
# nvim-packer 为配置 nvim 的目录 ~/.config/nvim-packer/...
alias nvim-packer="NVIM_APPNAME=nvim-packer nvim"
```
## 文件结构
```python
.
├── README.md
├── init.lua
├── lua
│   ├── appearance
│   │   ├── code-trouble.lua
│   │   ├── colorscheme.lua
│   │   ├── init-bufferline.lua
│   │   ├── init-indent.lua
│   │   ├── init-mason.lua
│   │   ├── init-statusline.lua
│   │   ├── init-symbols-outline.lua
│   │   ├── init-tree-sitter.lua
│   │   └── init-tree.lua
│   ├── coding
│   │   ├── awk.lua
│   │   ├── cpp.lua
│   │   ├── javascript.lua
│   │   ├── lua.lua
│   │   ├── python.lua
│   │   └── shell.lua
│   ├── dap
│   │   └── python.lua
│   ├── edit
│   │   ├── init-format.lua
│   │   ├── init-org-mode.lua
│   │   ├── map.lua
│   │   └── telescope.lua
│   ├── init-appearance.lua
│   ├── init-cmp.lua
│   ├── init-dap.lua
│   ├── init-edit.lua
│   ├── init-lsp.lua
│   └── plugins.lua
└── plugin
    └── packer_compiled.lua
```
# 目录结构
## 配置文件结构
```lua
-- 注意：
--	每次修改文件时，都需要重新编译，:PackerSync
--	配置文件不要和模块重名，否则会出错
~/.config/nvim
	init.lua 配置文件入口，包含其他的配置文件，也可以在任意文件中使用require('文件夹.文件名')
	lua
		plugins.lua 插件列表
		.lua 每个插件的配置文件
```
## init.lua
```lua
-- 用与修改参数，编辑器的基本设置
vim.o.~
-- 全局变量
vim.g.~
-- theme
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])
```
### 快捷键映射
```lua
local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap
map("n", "<leader>fd", "<Cmd>Telescope fd<CR>", opts)
vim.keymap.set("n", "tt", tree.toggle, opts)
```
## plugins.lua
```lua
return require('packer').startup(function(use)
	use { '插件' }
end)
```
## 其他文件
```lua
-- 启动插件，有的插件可能不需要，具体看官网
require("gruvbox").setup({
	-- 参数配置
})
```
# 插件
## 安装
```lua
1、在lua下新建plugins.lua
	将要安装的插件加到文件中，插件配置可放到其他文件,在init.lua中包含即可
2、在init.lua中添加刚写入的文件
	require('文件名')
	执行:PackerSync，安装插件
```
## Packer
```lua
-- You must run this or `PackerSync` whenever you make changes to your plugin configuration
-- Regenerate compiled loader file
:PackerCompile

-- Remove any disabled or unused plugins
:PackerClean

-- Clean, then install missing plugins
:PackerInstall

-- Clean, then update and install plugins
-- supports the `--preview` flag as an optional first argument to preview updates
:PackerUpdate

-- Perform `PackerUpdate` and then `PackerCompile`
-- supports the `--preview` flag as an optional first argument to preview updates
:PackerSync

-- Show list of installed plugins
:PackerStatus

-- Loads opt plugin immediately
:PackerLoad completion-nvim ale
```
## 常用插件
### 看插件的github
```lua
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Packer can manage itself

  -- colorscheme
  use { 'folke/tokyonight.nvim' }
  use { "catppuccin/nvim", as = "catppuccin" }
  use { 'navarasu/onedark.nvim' }
  use { "ellisonleao/gruvbox.nvim" }

  -- tree
  use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' } }
  -- bufferline
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = {'nvim-tree/nvim-web-devicons'} }
  -- Statusline
  use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true } }
  -- startup
  use { 'glepnir/dashboard-nvim', event = 'VimEnter',config = function() require('dashboard').setup{
    theme = 'hyper',
    config = {
      week_header = {
       enable = true,
      },
      shortcut = {
        {
          icon = ' ',
          icon_hl = '@variable',
          desc = 'Files',
          group = 'Label',
          action = 'Telescope find_files',
          key = 'f',
        },
      },
    },
  } end, requires = {'nvim-tree/nvim-web-devicons'} }
 
  -- ranger
  use { "kevinhwang91/rnvimr" }

  -- Autocompletion
  -- lsp
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  -- snip
  use {'hrsh7th/cmp-vsnip'}
  use {'hrsh7th/vim-vsnip'}
  use {'L3MON4D3/LuaSnip'} -- Snippets plugin
  use {'rafamadriz/friendly-snippets'}
  -- lspkind
  use {'onsails/lspkind-nvim'}
  -- cmp
  use {'hrsh7th/nvim-cmp'} -- Autocompletion plugin
  use {'hrsh7th/cmp-nvim-lsp'} -- LSP source for nvim-cmp
  use {'saadparwaiz1/cmp_luasnip'} -- Snippets source for nvim-cmp
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/cmp-path'}
  use {'hrsh7th/cmp-cmdline'}
  -- code trouble
  use { "folke/trouble.nvim", requires = "nvim-tree/nvim-web-devicons" }
  -- dap
  use { "williamboman/mason.nvim" }
  use { "rcarriga/nvim-dap-ui" }
  use { "mfussenegger/nvim-dap" }
  use { "theHamsta/nvim-dap-virtual-text" }
  -- code ui
  use({ "glepnir/lspsaga.nvim", branch = "main", config = function() require('lspsaga').setup({}) end,})
  use { 'simrat39/symbols-outline.nvim' }
  -- code comment
  use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end}
  -- format
  use { 'mhartington/formatter.nvim' }

  -- autopairs
  use { 'windwp/nvim-autopairs', config = function() require("nvim-autopairs").setup {} end}
  -- surround
  use ({ 'kylechui/nvim-surround', tag = "*", config = function() require("nvim-surround").setup({}) end})
  -- which-key
  use { "folke/which-key.nvim", config = function() vim.o.timeout = true vim.o.timeoutlen = 300 require("which-key").setup {} end }
  -- indent
  use { 'lukas-reineke/indent-blankline.nvim'}
  use { 'nvim-treesitter/nvim-treesitter' }
  -- telescope
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.1' }
  use { 'nvim-lua/plenary.nvim' }
  use { 'nvim-tree/nvim-web-devicons' }
  -- org-mode
  use { 'nvim-orgmode/orgmode' }

end)
```
### 插件依赖与配置
#### nvim-tree
```python
需要安装字体，重新设置终端的字体，否则会出现图标乱码，用字体册添加，补丁字体：[https://www.nerdfonts.com](https://www.nerdfonts.com)
推荐字体：FantasqueSansMono -> FantasqueSansM Nerd Font Mono
:NvimTree...
		-   `o` 打开关闭文件夹
		-   `a` 创建文件
		-   `f` 搜索文件
		-   `r` 重命名
		-   `x` 剪切
		-   `c` 拷贝
		-   `p` 粘贴
		-   `d` 删除
```
#### lualine
```python
底部状态栏
https://github.com/nvim-lualine/lualine.nvim
在plugins.lua中添加，之后将配置文件添加到appearance/init-statusline.lua
```
#### surround
```python
两端进行加减字符
	    Old text                    Command         New text
--------------------------------------------------------------------------------
    surr*ound_words             ysiw)           (surround_words)
    *make strings               ys$"            "make strings"
    [delete ar*ound me!]        ds]             delete around me!
    remove <b>HTML t*ags</b>    dst             remove HTML tags
    'change quot*es'            cs'"            "change quotes"
    <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
    delete(functi*on calls)     dsf             function calls
```
#### nvim-treesitter
```python
代码高亮显示，需要安装对应的语言解析器
`:TSUpdate`  已安装的解析器更新到最新版本
`:TSInstall <language_to_install>`
在官网查看对应的语言，(https://github.com/nvim-treesitter/nvim-treesitter)
在 init-tree-sitter.lua 中添加语言解析器，打开nvim，自动安装
```
#### ranger
##### 未安装
```python
安装试过，也可以使用(https://blog.csdn.net/lxyoucan/article/details/116486176)
use { "rbgrouleff/bclose.vim" }
use { "francoiscabrol/ranger.vim" }
```
##### 已安装
```python
use { "kevinhwang91/rnvimr" }
依赖：
	pip install ranger-fm pynvim2
	brew install highlight        高亮代码
`:RnvimrToggle` 打开
`:RnvimrResize` 循环预设布局
```
#### telescope
```python
https://github.com/nvim-telescope/telescope.nvim
需要额外安装：
	[BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep)
	brew install ripgrep
	[sharkdp/fd](https://github.com/sharkdp/fd)（finder）
	brew install fd
	[nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)（查找器/预览）
	[neovim LSP](https://neovim.io/doc/user/lsp.html)（采摘者）
	[devicons](https://github.com/kyazdani42/nvim-web-devicons)（图标）
使用：
	`<C-u>`在预览窗口中向上滚动
	`<C-d>`在预览窗口中向下滚动
```
### 代码
#### 补全
```lua
  -- Autocompletion
  -- lsp
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  -- snip
  use {'hrsh7th/cmp-vsnip'}
  use {'hrsh7th/vim-vsnip'}
  use {'L3MON4D3/LuaSnip'} -- Snippets plugin
  use {'rafamadriz/friendly-snippets'}
  -- lspkind
  use {'onsails/lspkind-nvim'}
  -- cmp
  use {'hrsh7th/nvim-cmp'} -- Autocompletion plugin
  use {'hrsh7th/cmp-nvim-lsp'} -- LSP source for nvim-cmp
  use {'saadparwaiz1/cmp_luasnip'} -- Snippets source for nvim-cmp
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/cmp-path'}
  use {'hrsh7th/cmp-cmdline'}
```
#### Comment
```python
gc: 将选中的区域进行注释或取消
gcc: 注释一行
```
#### mason
```python
管理 `language-server、dap` 的包管理器
	:Mason  使用，i 进行安装
```
#### dap
```python
安装的包只是调试的工具，需要额外安装对应语言的调试包
# python
	1、:Mason debugpy  (pip install debugpy) (mason安装的模块未起作用)
	2、配置 dap/python.lua
	3、将文件添加到 init-dap.lua
```
#### lspsaga
```python
显示函数引用位置、函数定义,重构,具体使用在 map.lua
```
#### complete
```python
在 lspconfig.lua 中，local servers = {''},里面的内容需要安装,到lspconfig的github上找相应的模块
```
##### python：
```python
	1、:Mason 安装pyright  (sudo npm install -g pyright)
	2、在init-lsp.lua 中配置server('pyright')
	3、其他配置写到 coding/python.lua
	4、将python.lua添加到init-lsp.lua
```
##### js：
```python
	1、:Mason 安装typescript-language-server  (sudo npm install -g typescript-language-server typescript)
	2、typescript-language-server --stdio(启动)
	3、在init-lsp.lua 中配置server('tsserver')
	4、其他配置写到 coding/javascript.lua
	5、将javascript.lua添加到init-lsp.lua
```
##### java：
##### shell:
```python
	1、:Mason 安装bash-language-server  (sudo npm i -g bash-language-server)
	2、在init-lsp.lua 中配置server('bashls')
	3、其他配置写到shell.lua
	4、shell.lua添加到init-lsp.lua
```
##### AWK:
```python
	1、:Mason 安装awk-language-server  (sudo npm install -g awk-language-server)
	2、在init-lsp.lua 中配置server('awk_ls')
	3、其他配置写到 coding/awk.lua
	4、awk.lua添加到init-lsp.lua
```
##### C++:
```python
	1、本次使用clangd，mac自带，无需安装,否则使用:Mason clangd
	2、在init-lsp.lua 中配置server('clangd')
	3、其他配置写到 coding/cpp.lua
	4、cpp.lua添加到init-lsp.lua
```
##### lua:
```python
	1、安装，brew install lua
	2、:Mason lua-language-server
	3、在init-lsp.lua 中配置server('lua_ls')
	4、其他配置写到 coding/lua.lua
	5、lua.lua添加到init-lsp.lua
```
#### format
```python
(https://github.com/mhartington/formatter.nvim)
基本插件：use { 'mhartington/formatter.nvim' }
```
##### lua:
```python
	(格式化后，不习惯，未安装)
	1、:Mason install stylua
	2、默认自带lua文件的配置，无需额外配置
	2、即可使用 :Format stylua
```
##### C:
```python
	1、brew install clang-format
	2、将配置添加到 edit/init-format.lua
	3、:Format clang-format
```
##### sh:
```python
	1、:mason shfmt
	2、将配置添加到 edit/init-format.lua
	3、:Format shfmt
```
##### python:
```python
	1、:mason autopep8
	2、将配置添加到 edit/init-format.lua
	3、:Format autopep8
```
##### js:
```python
	1、:mason prettier
	2、将配置添加到 edit/init-format.lua
	3、:Format prettier
```
# Ubuntu安装
1、sudo snap install nvim
2、图标乱码，安装字体
```shell
将字体文件传到目录内，
sudo mkdir -p /usr/share/fonts/custom
sudo mv Monaco.ttf /usr/share/fonts/custom
sudo chmod 744 /usr/share/fonts/custom/name.ttf
以下操作在 /usr/share/fonts/custom/
sudo mkfontscale  -- 生成核心字体信息
sudo mkfontdir
sudo fc-cache -fv
```

