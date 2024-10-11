return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",
    },
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "bash",
                "c",
                "cmake",
                "cpp",
                "lua",
                "nix",
                "rust",
                "toml",
                "vim",
                "vimdoc",
            },

            auto_install = true,

            indent = { enable = true },
            autotag = { enable = true },
            highlight = {
                enable = true,
                use_languagetree = true,
            },
        })
    end,
}
