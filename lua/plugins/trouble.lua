local M = {}

M.setup = function() end

return {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
        {
            "<leader>t",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
        },
    },
}
