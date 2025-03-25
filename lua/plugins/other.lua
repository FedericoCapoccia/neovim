return {

    "nvim-tree/nvim-web-devicons",
    "folke/which-key.nvim",

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
        "stevearc/dressing.nvim",
        event = "VeryLazy",
        config = function()
            require("dressing").setup()
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

    {
        "lukas-reineke/indent-blankline.nvim",
        opts = {
            indent = { char = "╎" },
            scope = { char = "╎" },
        },
        config = function(_, opts)
            local hooks = require "ibl.hooks"
            hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
            require("ibl").setup(opts)
        end,
    },

    -- LSP
    {
        "mfussenegger/nvim-jdtls",
        dependencies = {
            "neovim/nvim-lspconfig",
        },
    },
}
