local M = {
    keymap = { preset = "enter" },
    appearance = {
        nerd_font_variant = "normal",
    },
    completion = {
        menu = {
            -- TODO: wait for bug to be fixed and decrease it
            max_height = 100,
            min_width = 150,
            draw = {
                columns = { { "kind_icon" }, { "label", gap = 1 } },
                components = {
                    label = {
                        width = { fill = true, max = 150 },
                        text = function(ctx)
                            return require("colorful-menu").blink_components_text(ctx)
                        end,
                        highlight = function(ctx)
                            return require("colorful-menu").blink_components_highlight(ctx)
                        end,
                    },
                },
            },
        },
        documentation = { auto_show = true },
        list = {
            max_items = 200,
        },
    },
    signature = {
        enabled = true,
        window = {
            treesitter_highlighting = true,
            show_documentation = true,
        },
    },
    sources = {
        default = { "lsp", "path", "buffer" },
    },
}

return {
    "saghen/blink.cmp",
    enabled = false,
    version = "1.*",
    dependencies = {
        "onsails/lspkind.nvim",
        "xzbdmw/colorful-menu.nvim",
        "nvim-tree/nvim-web-devicons",
        "p00f/clangd_extensions.nvim",
    },
    opts = M,
}
