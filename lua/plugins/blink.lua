local M = {
    keymap = { preset = "enter" },
    appearance = {
        nerd_font_variant = 'normal'
    },
    completion = {
        menu = {
            draw = {
                components = {
                    label = {
                        text = function(ctx)
                            return require("colorful-menu").blink_components_text(ctx)
                        end,
                        highlight = function(ctx)
                            return require("colorful-menu").blink_components_highlight(ctx)
                        end,
                    },
                },
                treesitter = { 'lsp' }
            },
        },
        documentation = { auto_show = false }
    },
    signature = {
        enabled = true,
        window = {
            show_documentation = false
        }
    },
    sources = {
        default = { 'lsp', 'path', 'buffer' },
    },
}

return {
    'saghen/blink.cmp',
    version = "1.*",
    dependencies = {
        "onsails/lspkind.nvim",
        "xzbdmw/colorful-menu.nvim",
        "nvim-tree/nvim-web-devicons",
        "p00f/clangd_extensions.nvim",
    },
    opts = M
}
