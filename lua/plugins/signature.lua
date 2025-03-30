local M = {}

M.setup = function()
    require("lsp_signature").setup {
        bind = true,
        handler_opts = {
            border = "rounded",
        },
        hint_enable = true,
        toggle_key = "<C-k>",
        floating_window = false,
    }
end

return {
    "ray-x/lsp_signature.nvim",
    enabled = false,
    event = "InsertEnter",
    config = function()
        M.setup()
    end,
}
