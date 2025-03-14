local map = vim.keymap.set
local M = {}

M.setup = function()
    require("lspconfig").pyright.setup {
        on_attach = function(client, bufnr)
            require("configs.mappings").lsp_defaults(client, bufnr)
        end,
        capabilities = require("blink.cmp").get_lsp_capabilities(),
    }
end

return M
