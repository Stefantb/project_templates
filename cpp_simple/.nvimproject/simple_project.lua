local utils = require("projects.utils")
local root = utils.local_project_path(utils.script_path())

local M = {
    root_dir = root,

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
                lsp_root = root,
                cache_subdir = 'simple',
                compdb_dir = root,
            },
        },
        sessions = {
            session_name = root:gsub('/', '_'),
        },
    },
}

function M.on_project_open()
    vim.opt.makeprg = "make"
end

function M.on_project_close()
end

return M
