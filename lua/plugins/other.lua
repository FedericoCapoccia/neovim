return {

    {
        "windwp/nvim-autopairs",
        dependencies = "hrsh7th/nvim-cmp",
        config = function()
            require("nvim-autopairs").setup {
                fast_wrap = {},
                disable_filetype = { "TelescopePrompt", "vim" },
            }

            local cmp_autopairs = require "nvim-autopairs.completion.cmp"
            require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
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
