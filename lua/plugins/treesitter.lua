return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
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
                "c",
                "cmake",
                "cpp",
                "lua",
                "yaml",
                "rust",
                "toml",
                "json",
                "html",
                "typst",
                "zig",
                "nix",
                "markdown",
                "markdown_inline",
                "bash",
                "go",
                "http",
                "css",
                "javascript",
                "latex",
                "norg",
                "scss",
                "svelte",
                "tsx",
                "vue",
                "regex",
            },

            highlight = {
                enable = true,
                use_languagetree = true,
            },

            indent = { enable = true },
        }
    end,
}
