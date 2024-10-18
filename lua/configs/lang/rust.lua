local map = vim.keymap.set
local M = {}

M.setup = function()
    require("lspconfig").rust_analyzer.setup {
        on_attach = function(client, bufnr)
            require("configs.mappings").lsp_defaults(client, bufnr)
        end,
        capabilities = vim.lsp.protocol.make_client_capabilities(),
    }
end

return M