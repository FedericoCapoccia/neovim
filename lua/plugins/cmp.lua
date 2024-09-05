local has_words_before = function()
    ---@diagnostic disable-next-line: deprecated
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "saecki/crates.nvim",

        "dcampos/nvim-snippy",
        "honza/vim-snippets",
        "dcampos/cmp-snippy",
    },
    config = function()
        local cmp = require("cmp")
        local snippy = require("snippy")

        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif snippy.can_expand_or_advance() then
                        snippy.expand_or_advance()
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif snippy.can_jump(-1) then
                        snippy.previous()
                    else
                        fallback()
                    end
                end),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                ["<C-d>"] = cmp.mapping.scroll_docs(4),
            }),

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

            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "snippy" },
                { name = "buffer" },
                { name = "path" },
                { name = "crates" },
            }),

            snippet = {
                expand = function(args)
                    require("snippy").expand_snippet(args.body)
                end,
            },
        })

        require("crates").setup({
            completion = {
                cmp = {
                    enabled = true,
                },
            },
        })
    end,
}
