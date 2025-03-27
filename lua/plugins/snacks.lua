local M = {
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    indent = {
        enabled = true,
        char = "╎",
        scope = { char = "╎" }
    },
    input = { enabled = true },
    picker = {
        enabled = true,
        sources = {
            explorer = {
                auto_close = true,
            }
        }
    },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    gitbrowse = {},
    terminal = {
        win = { position = "right" },
    }
}


return {
    "folke/snacks.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "echasnovski/mini.nvim"
    },
    priority = 1000,
    lazy = false,
    opts = M,

    keys = {
        { "<leader>pf", function() Snacks.picker.files() end,        desc = "Find Files" },
        { "<leader>ps", function() Snacks.picker.git_status() end,   desc = "Git Status" },
        { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
        { "<leader>x",  function() Snacks.bufdelete() end,           desc = "Delete Buffer" },
        { "<leader>gB", function() Snacks.gitbrowse() end,           desc = "Git Browse",     mode = { "n", "v" } },
        { "<F5>",       function() Snacks.terminal.toggle() end,     desc = "Toggle Terminal" },
        { "<leader>e",  function() Snacks.explorer() end,            desc = "File Explorer" },
    }

}
