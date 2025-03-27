local M = {
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
}


return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = M,

    keys = {
        { "<leader>pf", function() Snacks.picker.files() end, desc = "Find Files" },
    }

}
