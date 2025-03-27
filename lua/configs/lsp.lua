vim.lsp.config('*', {
    capabilities = {
        textDocument = {
            semanticTokens = {
                multilineTokenSupport = true,
            }
        }
    },
    root_markers = { '.git' },
})

vim.lsp.enable { "clangd", "rust_analyzer", "lua-language-server" }
-- cmake, lua_ls, pyright

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)

        local function opts(desc)
            return { buffer = ev.buf, desc = "LSP " .. desc, noremap = true }
        end

        client.server_capabilities = vim.tbl_deep_extend("force", client.server_capabilities,
            require("cmp_nvim_lsp").default_capabilities())

        if client:supports_method "textDocument/inlayHint" then
            vim.lsp.inlay_hint.enable(true)
        end

        if client:supports_method "textDocument/formatting" then
            vim.keymap.set("n", "<leader>ff", function()
                require("conform").format { async = true, lsp_fallback = true }
            end, opts "Formatter")
        end
    end,
})
