return {

    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {
                fast_wrap = {},
                disable_filetype = { "TelescopePrompt", "vim" },
            }
        end,
    },

    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup { "*" }
        end,
    },

    {
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                delete = { text = "󰍵" },
                changedelete = { text = "󱕖" },
            },
        },
    },
    -- LSP
    {
        "mfussenegger/nvim-jdtls",
        dependencies = {
            "neovim/nvim-lspconfig",
        },
    },
}
