local M = {
    enable = {
        legacy_highlights = false,
    },

    styles = {
        transparency = true,
    },
}

return {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    opts = M,
}
