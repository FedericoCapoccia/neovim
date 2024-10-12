local M = {}

M.base46 = {
    theme = "flexoki",
    transparency = true,
}

M.ui = {
    statusline = {
        enabled = true,
        theme = "vscode_colored",
    },

    telescope = { style = "borderless" },

    lsp = { signature = true },
}

M.lsp = { signature = true }

M.mason = { pkgs = {
    "lua-language-server",
    "stylua",
    "clangd",
    "clang-format",
} }

return M
