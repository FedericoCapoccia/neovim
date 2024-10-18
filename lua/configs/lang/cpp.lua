local map = vim.keymap.set
local M = {}

M.setup = function()
    require("lspconfig").clangd.setup {
        on_attach = function(client, bufnr)
            client.server_capabilities.signatureHelpProvider = false
            require("clangd_extensions.inlay_hints").setup_autocmd()
            require("clangd_extensions.inlay_hints").set_inlay_hints()

            local function opts(desc)
                return { buffer = bufnr, desc = "LSP " .. desc, noremap = true }
            end

            map("n", "<A-o>", "<cmd>ClangdSwitchSourceHeader<CR>", opts "Switch source header")

            require("configs.mappings").lsp_defaults(client, bufnr)
        end,
        capabilities = vim.lsp.protocol.make_client_capabilities(),
        cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--all-scopes-completion",
            "--pch-storage=memory",
            "-j=4",
            "--log=verbose",
            "--pretty",
        },
        init_options = {
            fallbackFlags = { "-std=c++23" },
        },
    }

    require("lspconfig").cmake.setup {
        on_attach = function(client, bufnr)
            require("configs.mappings").lsp_defaults(client, bufnr)
        end,
        capabilities = vim.lsp.protocol.make_client_capabilities(),
    }
end

return M