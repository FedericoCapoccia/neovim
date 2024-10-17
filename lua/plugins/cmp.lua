local M = {}

return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        -- cmp modules
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "onsails/lspkind.nvim",

        -- lsp thingies
        "saecki/crates.nvim",
        "p00f/clangd_extensions.nvim",

        {
            "L3MON4D3/LuaSnip",
            version = "v2.*",
            dependencies = "rafamadriz/friendly-snippets",
            -- install jsregexp (optional!).
            -- build = "make install_jsregexp",
        },
    },
    config = function()
        local cmp = require "cmp"
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup {
            completion = { completeopt = "menu,menuone,noinsert" },

            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },

            mapping = {
                ["<Up>"] = cmp.mapping.select_prev_item(),
                ["<Down>"] = cmp.mapping.select_next_item(),
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<CR>"] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true,
                },

                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif require("luasnip").expand_or_jumpable() then
                        require("luasnip").expand_or_jump()
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif require("luasnip").jumpable(-1) then
                        require("luasnip").jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            },

            sources = {
                { name = "nvim_lsp" },
                { name = "luasnip" },
                -- { name = "buffer" },
                { name = "nvim_lua" },
                { name = "path" },
            },

            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },

            formatting = {
                format = function(_, vim_item)
                    vim_item.menu = nil
                    return vim_item
                end,
            },
        }

        require("crates").setup {
            completion = { cmp = { enabled = false } },
        }
    end,
}
