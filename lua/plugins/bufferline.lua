return {
    "akinsho/bufferline.nvim",
    tag = "v4.7.0",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "folke/snacks.nvim",
    },
    config = function()
        local bufferline = require "bufferline"
        bufferline.setup {
            options = {
                style_preset = bufferline.style_preset.minimal,
                diagnostics = "nvim_lsp",
                close_command = function()
                    Snacks.bufdelete.delete()
                end,
                right_mouse_command = function()
                    Snacks.bufdelete.delete()
                end,
                left_mouse_command = "buffer %d",
            },
        }
        require("configs.mappings").bufferline()
    end,
}
