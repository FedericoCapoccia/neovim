return {
    "akinsho/bufferline.nvim",
    tag = "v4.7.0",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "famiu/bufdelete.nvim",
    },
    config = function()
        local bufferline = require "bufferline"
        bufferline.setup {
            options = {
                style_preset = bufferline.style_preset.minimal,
                diagnostics = "nvim_lsp",
                close_command = function()
                    require("bufdelete").bufdelete(0)
                end,
                right_mouse_command = function()
                    require("bufdelete").bufdelete(0)
                end,
                left_mouse_command = "buffer %d",
            },
        }
        require("configs.mappings").bufferline()
    end,
}
