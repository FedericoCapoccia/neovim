vim.lsp.config("*", {
    capabilities = {
        textDocument = {
            semanticTokens = {
                multilineTokenSupport = true,
            },
        },
    },
    root_markers = { ".git" },
})

vim.lsp.enable { "clangd", "rust_analyzer", "lua-language-server", "cmake" }
-- cmake, lua_ls, pyright

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)

        local function opts(desc)
            return { buffer = ev.buf, desc = "LSP " .. desc, remap = true }
        end

        -- client.server_capabilities = vim.tbl_deep_extend("force", client.server_capabilities,
        -- require("cmp_nvim_lsp").default_capabilities())

        if client:supports_method "textDocument/inlayHint" then
            vim.lsp.inlay_hint.enable(true)
        end

        if client:supports_method "textDocument/formatting" then
            vim.keymap.set("n", "<leader>ff", function()
                require("conform").format { async = true, lsp_fallback = true }
            end, opts "Formatter")
        end

        if client:supports_method "textDocument/codeAction" then
            vim.keymap.set({ "n", "v" }, "<C-Space>", vim.lsp.buf.code_action, opts "Code action")
        end

        if client:supports_method "textDocument/declaration" then
            vim.keymap.set("n", "gD", function()
                Snacks.picker.lsp_declarations()
            end, opts "Go to declaration")
        end

        if client:supports_method "textDocument/definition" then
            vim.keymap.set("n", "gd", function()
                Snacks.picker.lsp_definitions()
            end, opts "Go to definition")
        end

        if client:supports_method "textDocument/implementation" then
            vim.keymap.set("n", "gi", function()
                Snacks.picker.lsp_implementations()
            end, opts "Go to implementation")
        end

        if client:supports_method "textDocument/hover" then
            vim.keymap.set("n", "<leader>sd", vim.lsp.buf.hover, opts "Hover documentation")
        end

        if client:supports_method "textDocument/typeDefinition*" then
            vim.keymap.set("n", "<leader>D", function()
                Snacks.picker.lsp_type_definitions()
            end, opts "Go to type definition")
        end

        if client:supports_method "textDocument/rename" then
            vim.keymap.set("n", "<f2>", vim.lsp.buf.rename, opts "Rename")
        end

        if client:supports_method "textDocument/signatureHelp" then
            vim.keymap.set("n", "<leader>sh", function()
                require("lsp_signature").toggle_float_win()
            end, opts "Show signature help")
        end

        -- Extra
        vim.keymap.set("n", "<A-o>", "<cmd>ClangdSwitchSourceHeader<CR>", opts "Switch source header")

        vim.keymap.set("n", "<leader>ll", function()
            require("lint").try_lint()
        end, opts "Linter")
    end,
})
