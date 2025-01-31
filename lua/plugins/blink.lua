return {
    "saghen/blink.cmp",
    dependencies = "rafamadriz/friendly-snippets",
    version = "*",

    opts = {
        keymap = { preset = "enter" },

        appearance = {
            use_nvim_cmp_as_default = false,
            nerd_font_variant = "normal",
        },

        completion = {
            menu = {
                border = "rounded",
                winblend = 0,

                draw = {
                    columns = { { "kind_icon" }, { "label", gap = 1 } },
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
                },
            },

            documentation = {
                window = { border = "rounded", winblend = 0 },
                auto_show = true,
                auto_show_delay_ms = 200,
            },
        },

        signature = { window = { border = "single" } },

        sources = {
            default = { "lsp", "path", "snippets" },
        },
    },
    opts_extend = { "sources.default" },
}
