local M = {}

M.setup = function()
    require("lspkind").init {}
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

                function(entry1, entry2)
                    local kind1 = entry1:get_kind()
                    local kind2 = entry2:get_kind()

                    local lsp_kind = cmp.lsp.CompletionItemKind
                    local is_snippet = function(kind)
                        return kind == lsp_kind.Snippet
                    end

                    if is_snippet(kind1) and not is_snippet(kind2) then
                        return false
                    elseif not is_snippet(kind1) and is_snippet(kind2) then
                        return true
                    end
                end,

                cmp.config.compare.recently_used,
                cmp.config.compare.kind,
                cmp.config.compare.sort_text,
                cmp.config.compare.length,
                cmp.config.compare.order,
            },
        },

        window = {
            completion = {
                -- winhighlight = "Normal:Normal,FloatBorder:CmpCompletionBorder,CursorLine:Pmenu",
                border = "rounded",
            },
            documentation = {
                -- winhighlight = "Normal:Normal,FloatBorder:CmpCompletionBorder",
                border = "rounded",
            },
        },

        formatting = {
            fields = { "abbr", "kind", "menu" },
            expandable_indicator = true,
            format = function(entry, vim_item)
                vim_item = kind_formatter(entry, vim_item)
                local highlights_info = require("colorful-menu").cmp_highlights(entry)
                if highlights_info ~= nil then
                    vim_item.abbr_hl_group = highlights_info.highlights
                    vim_item.abbr = highlights_info.text
                end

                return vim_item
            end,
        },
    }
end

return {
    "hrsh7th/nvim-cmp",
    enabled = true,
    event = "InsertEnter",
    dependencies = {
        -- cmp modules
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "onsails/lspkind.nvim",
        "xzbdmw/colorful-menu.nvim",

        -- lsp thingies
        "p00f/clangd_extensions.nvim",
    },
    config = function()
        M.setup()
    end,
}
