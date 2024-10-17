local M = {
    disabled_filetypes = {
        statusline = {},
        winbar = {},
    },
    globalstatus = true,
}

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = M,
}
