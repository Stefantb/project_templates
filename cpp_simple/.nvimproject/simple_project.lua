local utils = require("projects.utils")
local project_root = utils.local_project_path(utils.script_path())

local M = {
    root_dir = project_root,

    extensions = {
        builds = {
            build = {
                executor = "vim",
                compiler = "gcc",
                makeprg = "make buill",
                abortcommand = "AbortDispatch",
            },
        },
        lspconfig = {
            clangd = {
                lsp_root = project_root,
            },
        },
        sessions = {
            session_name = project_root:gsub('/', '_'),
        },
    },
}

require("dap").configurations.cpp = {
	{
		name = "Launch exe via codelldb",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.getcwd() .. "/build/exe"
		end,
		cwd = project_root,
		stopOnEntry = false,
	},
	{
		name = "launch exe via cppdbg",
		type = "cppdbg",
		request = "launch",
		program = function()
			return vim.fn.getcwd() .. "/build/exe"
		end,
		cwd = "${workspaceFolder}",
		stopAtEntry = true,
		setupCommands = {
			{
				text = "-enable-pretty-printing",
				description = "enable pretty printing",
				ignoreFailures = false,
			},
		},
	},
	{
		name = "Attach to gdbserver :1234",
		type = "cppdbg",
		request = "launch",
		MIMode = "gdb",
		miDebuggerServerAddress = "localhost:1234",
		miDebuggerPath = "/usr/bin/gdb",
		cwd = "${workspaceFolder}",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		setupCommands = {
			{
				text = "-enable-pretty-printing",
				description = "enable pretty printing",
				ignoreFailures = false,
			},
		},
	},
}

function M.on_project_open()
    vim.opt.makeprg = "make"
end

function M.on_project_close()
end

return M
