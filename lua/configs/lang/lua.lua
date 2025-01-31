local M = {}

M.setup = function()
    require("lspconfig").lua_ls.setup {
        on_attach = function(client, bufnr)
            require("configs.mappings").lsp_defaults(client, bufnr)
        end,
        -- capabilities = require("cmp_nvim_lsp").default_capabilities(),

        capabilities = require("blink.cmp").get_lsp_capabilities(),

        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
                telemetry = {
                    enable = false,
                },
                workspace = {
                    library = {
                        vim.fn.expand "$VIMRUNTIME/lua",
                        vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
                        vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
                        "${3rd}/luv/library",
                    },
                    maxPreload = 100000,
                    preloadFileSize = 10000,
                },
            },
        },
    }
end

return M
