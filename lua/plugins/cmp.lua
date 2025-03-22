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
        },
    },
    config = function()
        local lspkind = require "lspkind"
        lspkind.init {
            symbol_map = {
                Copilot = "",
            },
        }

        local kind_formatter = lspkind.cmp_format {
            mode = "symbol_text",
            menu = {
                buffer = "[buf]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[api]",
                path = "[path]",
                luasnip = "[snip]",
                gh_issues = "[issues]",
                tn = "[TabNine]",
                eruby = "[erb]",
            },
        }

        local cmp = require "cmp"
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup {
            completion = { completeopt = "menu,menuone,noinsert" },

            snippet = {
                expand = function(args)
                    vim.snippet.expand(args.body)
                end,
            },

            mapping = {
                ["<Up>"] = cmp.mapping.select_prev_item(),
                ["<Down>"] = cmp.mapping.select_next_item(),
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
                {
                    name = "lazydev",
                    -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
                    group_index = 0,
                },
                { name = "nvim_lsp" },
                { name = "path" },
                { name = "crates" },
            },

            --from https://github.com/tjdevries/config.nvim/blob/master/lua/custom/completion.lua
            sorting = {
                priority_weight = 2,
                comparators = {
                    cmp.config.compare.offset,
                    cmp.config.compare.exact,
                    cmp.config.compare.score,
                    cmp.config.compare.recently_used,
                    cmp.config.compare.locality,
                    cmp.config.compare.kind,
                    cmp.config.compare.sort_text,
                    cmp.config.compare.length,
                    cmp.config.compare.order,
                },
            },

            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },

            formatting = {
                fields = { "abbr", "kind", "menu" },
                expandable_indicator = true,
                format = function(entry, vim_item)
                    -- Lspkind setup for icons
                    vim_item = kind_formatter(entry, vim_item)

                    -- Tailwind colorizer setup
                    -- vim_item = require("tailwindcss-colorizer-cmp").formatter(entry, vim_item)

                    return vim_item
                end,
            },
        }

        require("crates").setup {
            completion = { cmp = { enabled = true } },
        }
    end,
}
