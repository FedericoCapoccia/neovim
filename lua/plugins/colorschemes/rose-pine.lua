local M = {
    enable = {
        legacy_highlights = false,
    },

    styles = {
        transparency = true,
        italic = false,
        bold = false,
    },

    highlight_groups = {
        Comment = { italic = true },
    },
}

return {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    opts = M,
}
