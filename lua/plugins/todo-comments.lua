local M = {
    search = {
        command = "rg",
        args = {
            "--color=always", --change
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
        },

        pattern = [[\b(KEYWORDS):]], -- ripgrep regex
    },
}

return {
    "folke/todo-comments.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    lazy = false,
    opts = M,
}
