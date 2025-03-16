local M = {}

M.setup = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
    local on_attach = function(client, bufnr)
        require("configs.mappings").lsp_defaults(client, bufnr)
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
    }
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
            require("lint").try_lint()
        end,
    })

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
        --"saghen/blink.cmp",
        "hrsh7th/nvim-cmp", -- CMP plugin
        "hrsh7th/cmp-nvim-lsp",
        "stevearc/conform.nvim", -- Formatter
        "mfussenegger/nvim-lint", -- Linter

        "p00f/clangd_extensions.nvim",
        "saecki/crates.nvim",
    },
    config = function()
        M.setup()
    end,
}
