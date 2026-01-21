return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    dependencies = {
        "OXY2DEV/markview.nvim",
    },
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
                -- C/Cpp
                "c",
                "cmake",
                "cpp",
                -- lua
                "lua",
                -- rust
                "yaml",
                "rust",
                "toml",
                -- web
                "json",
                "html",
                "typst",
                -- zig
                "zig",
                -- nix
                "nix",
                -- others
                "markdown",
                "markdown_inline",
                "bash",
            },

            highlight = {
                enable = true,
                use_languagetree = true,
            },

            indent = { enable = true },
        }
    end,
}
