local M = {}

M.setup = function()
    local kind_formatter = require("lspkind").cmp_format {
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
    cmp.setup {
        completion = { completeopt = "menu,menuone,noinsert" },

        mapping = {
            ["<Up>"] = cmp.mapping.select_prev_item(),
            ["<Down>"] = cmp.mapping.select_next_item(),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<Tab>"] = cmp.mapping.select_next_item(),
            ["<S-Tab>"] = cmp.mapping.select_prev_item(),
            ["<CR>"] = cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
            },
        },

        sources = {
            { name = "nvim_lsp" },
            { name = "path" },
            { name = "crates" },
        },

        -- from https://github.com/tjdevries/config.nvim/blob/master/lua/custom/completion.lua
        sorting = {
            priority_weight = 1,
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
            completion = {
                winhighlight = "Normal:Normal,FloatBorder:CmpCompletionBorder,CursorLine:Pmenu",
                border = "rounded",
            },
            documentation = {
                winhighlight = "Normal:Normal,FloatBorder:CmpCompletionBorder",
                border = "rounded",
            },
        },

        formatting = {
            fields = { "abbr", "kind", "menu" },
            expandable_indicator = true,
            format = function(entry, vim_item)
                vim_item = kind_formatter(entry, vim_item)
                return vim_item
            end,
        },
    }

    require("crates").setup {
        completion = { cmp = { enabled = true } },
    }
end

return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        -- cmp modules
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "onsails/lspkind.nvim",

        -- lsp thingies
        "saecki/crates.nvim",
        "p00f/clangd_extensions.nvim",
    },
    config = function()
        M.setup()
    end,
}
