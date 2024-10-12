local M = {}
local map = vim.keymap.set

M.on_attach = function(_, bufnr)
    local function opts(desc)
        return { buffer = bufnr, desc = "LSP " .. desc }
    end

    map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
    map("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
    map("n", "gi", vim.lsp.buf.implementation, opts "Go to implementation")
    map("n", "<leader>sh", vim.lsp.buf.signature_help, opts "Show signature help")
    map("n", "<leader>sd", vim.lsp.buf.hover, opts "Hover documentation")
    map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Go to type definition")
    map("n", "<F2>", require "nvchad.lsp.renamer", opts "NvRenamer")

    map({ "n", "v" }, "<C-Space>", vim.lsp.buf.code_action, opts "Code action")

    map("n", "<leader>ff", function()
        require("conform").format { async = true, lsp_fallback = true }
    end, opts "Formatter")
end

M.on_init = function(client, _)
    if client.supports_method "textDocument/semanticTokens" then
        client.server_capabilities.semanticTokensProvider = nil
    end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
    documentationFormat = { "markdown", "plaintext" },
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    deprecatedSupport = true,
    commitCharactersSupport = true,
    tagSupport = { valueSet = { 1 } },
    resolveSupport = {
        properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
        },
    },
}

M.defaults = function()
    dofile(vim.g.base46_cache .. "lsp")
    require("nvchad.lsp").diagnostic_config()

    require("lspconfig").clangd.setup {
        on_attach = M.on_attach,
        capabilities = M.capabilities,
        on_init = M.on_init,
        cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--fallback-style=webkit",
        },
    }

    require("lspconfig").lua_ls.setup {
        on_attach = M.on_attach,
        capabilities = M.capabilities,
        on_init = M.on_init,

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
                        vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
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

require("conform").setup {
    formatters_by_ft = {
        lua = { "stylua" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        hpp = { "clang-format" },
        h = { "clang-format" },
        rust = { "rustfmt" },
    },
    format_on_save = { lsp_fallback = true },
}

return M
