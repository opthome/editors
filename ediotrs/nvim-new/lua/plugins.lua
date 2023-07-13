
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
