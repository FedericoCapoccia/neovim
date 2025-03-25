local M = {}

M.setup = function()
    require("lspkind").init {}
end

return {
    "onsails/lspkind.nvim",
    config = function()
        M.setup()
    end,
}
