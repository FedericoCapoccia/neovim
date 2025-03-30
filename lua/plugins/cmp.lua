local M = {}

M.setup = function()
    local cmp = require "cmp"
    cmp.setup {
        completion = {
            completeopt = "menu,menuone,noinsert",
        },

        mapping = {
            ["<Up>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
            ["<Down>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<Tab>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
            ["<S-Tab>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
            ["<CR>"] = cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
            },
        },

        sources = {
            { name = "nvim_lsp" },
            { name = "path" },
        },

        sorting = {
            priority_weight = 2,
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
            fields = { "menu", "abbr", "kind" },
            format = function(entry, item)
                local menu_icon = {
                    nvim_lsp = "λ",
                    vsnip = "⋗",
                    buffer = "Ω",
                    path = "🖫",
                }
                item.menu = menu_icon[entry.source.name]

                return item
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

        -- lsp thingies
        "p00f/clangd_extensions.nvim",
    },
    config = function()
        M.setup()
    end,
}
