local dap = require("dap")
dap.adapters.codelldb = {
	type = 'server',
	host = '127.0.0.1',
	port = 13000,
	executable = {
	  command = '/Users/wcj/.local/share/nvim/mason/bin/codelldb',
	  args = {"--port", 13000 },
	}
}

dap.configurations.cpp = {
	{
		name = "Launch file",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
	},
}
