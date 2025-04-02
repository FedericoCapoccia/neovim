local M = {
    formatters_by_ft = {
        lua = { "stylua" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        hpp = { "clang-format" },
        h = { "clang-format" },
        rust = { "rustfmt" },
        python = { "black" },
        json = { "prettier" },
        nix = { "nixfmt" },
    },
    format_on_save = { lsp_fallback = true },
}

return {
    "stevearc/conform.nvim", -- Formatter
    opts = M,
}
