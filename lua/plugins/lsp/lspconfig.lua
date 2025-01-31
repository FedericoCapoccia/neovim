local M = {}

M.setup = function()
    require("configs.lang.cpp").setup()
    require("configs.lang.lua").setup()
    require("configs.lang.rust").setup()

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
end

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        -- "hrsh7th/nvim-cmp",
        -- "hrsh7th/cmp-nvim-lsp",
        "stevearc/conform.nvim",
        "saghen/blink.cmp",
        "p00f/clangd_extensions.nvim",
    },
    config = function()
        M.setup()
    end,
}
