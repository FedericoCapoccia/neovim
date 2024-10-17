local M = {}

M.base46 = {
    theme = "flexoki",
    transparency = true,
    theme_toggle = { "flexoki", "onedark" }
}

M.ui = {
    statusline = {
        enabled = true,
        theme = "vscode_colored",
    },

    telescope = { style = "borderless" },

    cmp = {
        icons_left = false, -- only for non-atom styles!
        lspkind_text = true,
        style = "default", -- default/flat_light/flat_dark/atom/atom_colored
        format_colors = {
            tailwind = false, -- will work for css lsp too
            icon = "󱓻",
        },
    },
}

M.lsp = { signature = true }

M.mason = {
    pkgs = {
        "lua-language-server",
        "stylua",
        "clangd",
        "clang-format",
        "rust-analyzer",
        "cmake-language-server",
    },
}

M.colorify = {
    enabled = true,
    mode = "virtual", -- fg, bg, virtual
    virt_text = "󱓻 ",
    highlight = { hex = true, lspvars = true },
}

return M
