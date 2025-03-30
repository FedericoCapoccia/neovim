local M = {}

M.setup = function()
    require("kanagawa").setup {
        transparent = false,
    }
end

return {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    priority = 1000,
    config = function()
        M.setup()
    end,
}
