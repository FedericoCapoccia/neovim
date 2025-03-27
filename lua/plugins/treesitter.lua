return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        vim.opt.foldmethod = "expr"
        vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.opt.foldcolumn = "0"
        vim.opt.foldtext = ""
        vim.opt.foldlevel = 99
        vim.opt.foldlevelstart = 99

        local configs = require "nvim-treesitter.configs"

        configs.setup {
            ensure_installed = {
                "c",
                "cpp",
                "cmake",
                "lua",
                "bash",
                "json",
                "rust",
                "toml",
                "markdown"
            },

            highlight = {
                enable = true,
                use_languagetree = true,
            },

            indent = { enable = true },
        }
    end,
}
