local utils = require("projects.utils")
local mypath = utils.local_project_path(utils.script_path())

local M = {
	root_dir = mypath,

	extensions = {
		builds = {
			build = {
				executor = "vim",
				compiler = "gcc",
				makeprg = "make",
				command = "builder make",
				abortcommand = "AbortDispatch",
			},
		},
		lspconfig = {
			clangd = {
				lsp_root = mypath,
				cache_subdir = 'simple',
				compdb_dir = mypath,
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
