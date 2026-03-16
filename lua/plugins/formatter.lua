local M = {
    formatters_by_ft = {
        lua = { "stylua" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        hpp = { "clang-format" },
        h = { "clang-format" },
        rust = { "rustfmt" },
        python = { "black" },
        json = { "prettierd" },
        nix = { "nixfmt" },
        asm = { "asmfmt" },
        typescript = { "prettierd" },
        javascript = { "prettierd" },
        typescriptreact = { "prettierd" },
        javascriptreact = { "prettierd" },
    },
    format_on_save = { lsp_fallback = true },
}

return {
    "stevearc/conform.nvim", -- Formatter
    opts = M,
}
