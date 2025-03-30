local M = {}

M.setup = function()
    require("vscode").setup {
        transparent = true,
    }
end

return {
    "Mofiqul/vscode.nvim",
    name = "vscode",
    priority = 1000,
    config = function()
        M.setup()
    end,
}
