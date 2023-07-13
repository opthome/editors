-- Utilities for creating configurations
local util = require("formatter.util")
-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,

	filetype = {

		lua = {
			require("formatter.filetypes.lua").stylua,
			function()
				if util.get_current_buffer_file_name() == "special.lua" then
					return nil
				end
				return {
					exe = "stylua",
					args = {
						"--search-parent-directories",
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--",
						"-",
					},
					stdin = true,
				}
			end,
		},

		c = {
			require("formatter.filetypes.c").clangformat,
			function()
				return {
					exe = "clang-format",
					args = {
						'-style="{IndentWidth: ' .. vim.api.nvim_buf_get_option(0, "tabstop") .. '}"',
						"-assume-filename",
						util.escape_path(util.get_current_buffer_file_name()),
					},
					stdin = true,
					try_node_modules = true,
				}
			end,
		},
		cpp = {
			require("formatter.filetypes.cpp").clangformat,
			function()
				return {
					exe = "clang-format",
					args = {
						'-style="{IndentWidth: ' .. vim.api.nvim_buf_get_option(0, "tabstop") .. '}"',
						"-assume-filename",
						util.escape_path(util.get_current_buffer_file_name()),
					},
					stdin = true,
					try_node_modules = true,
				}
			end,
		},

		sh = {
			require("formatter.filetypes.sh").shfmt,
			function()
				return {
					exe = "shfmt",
					args = {
						"-l",
						"-w",
					},
					stdin = true,
				}
			end,
		},
		python = {
			require("formatter.filetypes.python").autopep8,
			function()
				return {
					exe = "autopep8",
					args = {},
					stdin = true,
				}
			end,
		},
		javascript = {
			require("formatter.filetypes.javascript").prettier,
			function()
				return {
					exe = "prettier",
					args = {},
					stdin = true,
				}
			end,
		},
		-- Use the special "*" filetype for defining formatter configurations on
		-- any filetype
		["*"] = {
			-- "formatter.filetypes.any" defines default configurations for any
			-- filetype
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

-- 保存时自动格式化
vim.api.nvim_exec(
	[[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END
]],
	true
)
