require "configs"

vim.cmd "colorscheme onedark"
-- vim.cmd "colorscheme rose-pine-main"

vim.lsp.enable { "clangd", "rust_analyzer", "lua-language-server" }
-- cmake, lua_ls, pyright

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)

        if client:supports_method "textDocument/inlayHint" then
            vim.defer_fn(function()
                vim.lsp.inlay_hint.enable(true)
            end, 500)
        end
    end,
})
