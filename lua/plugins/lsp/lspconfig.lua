local M = {}

M.setup = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
    local methods = vim.lsp.protocol.Methods

    local on_attach = function(client, bufnr)
        require("configs.mappings").lsp_defaults(client, bufnr)

        if client.supports_method(methods.textDocument_documentHighlight) then
            local under_cursor_highlights_group =
                vim.api.nvim_create_augroup("main/cursor_highlights", { clear = false })

            vim.api.nvim_create_autocmd({ "CursorHold", "InsertLeave" }, {
                group = under_cursor_highlights_group,
                desc = "Highlight references under the cursor",
                buffer = bufnr,
                callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "InsertEnter", "BufLeave" }, {
                group = under_cursor_highlights_group,
                desc = "Clear highlight references",
                buffer = bufnr,
                callback = vim.lsp.buf.clear_references,
            })
        end

        if client.supports_method(methods.textDocument_inlayHint) then
            local inlay_hints_group = vim.api.nvim_create_augroup("main/toggle_inlay_hints", { clear = false })

            -- Initial inlay hint display.
            -- Idk why but without the delay inlay hints aren't displayed at the very start.
            vim.defer_fn(function()
                local mode = vim.api.nvim_get_mode().mode
                vim.lsp.inlay_hint.enable(mode == "n" or mode == "v", { bufnr = bufnr })
            end, 500)

            vim.api.nvim_create_autocmd("InsertEnter", {
                group = inlay_hints_group,
                desc = "Enable inlay hints",
                buffer = bufnr,
                callback = function()
                    vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
                end,
            })

            vim.api.nvim_create_autocmd("InsertLeave", {
                group = inlay_hints_group,
                desc = "Disable inlay hints",
                buffer = bufnr,
                callback = function()
                    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                end,
            })
        end
    end

    local servers = require "configs.servers"
    for server, opts in pairs(servers) do
        opts.capabilities = capabilities
        opts.on_attach = on_attach
        require("lspconfig")[server].setup(opts)
    end

    -- Formatter
    require("conform").setup {
        formatters_by_ft = {
            lua = { "stylua" },
            c = { "clang-format" },
            cpp = { "clang-format" },
            hpp = { "clang-format" },
            h = { "clang-format" },
            rust = { "rustfmt" },
            python = { "black" },
        },
        format_on_save = { lsp_fallback = true },
    }

    -- Linter
    require("lint").linters_by_ft = {
        python = { "pylint" },
        rust = { "clippy" },
        cmake = { "cmakelint" },
    }

    require("crates").setup {
        lsp = {
            enabled = true,
            on_attach = on_attach,
            actions = true,
            completion = true,
            hover = true,
        },
    }
end

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/nvim-cmp", -- CMP plugin
        "hrsh7th/cmp-nvim-lsp",
        "stevearc/conform.nvim", -- Formatter
        "mfussenegger/nvim-lint", -- Linter
        {
            -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
            -- used for completion, annotations and signatures of Neovim apis
            "folke/lazydev.nvim",
            ft = "lua",
            opts = {
                library = {
                    -- Load luvit types when the `vim.uv` word is found
                    { path = "luvit-meta/library", words = { "vim%.uv" } },
                    { path = "/usr/share/awesome/lib/", words = { "awesome" } },
                },
            },
        },

        "p00f/clangd_extensions.nvim",
        "saecki/crates.nvim",
    },
    config = function()
        M.setup()
    end,
}
