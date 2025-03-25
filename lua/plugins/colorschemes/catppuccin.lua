local M = {}

M.setup = function()
    require("catppuccin").setup {
        transparent_background = true,
    }
end

return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        M.setup()
    end,
}
