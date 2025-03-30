return {
    "xzbdmw/colorful-menu.nvim",
    config = function()
        -- You don't need to set these options.
        require("colorful-menu").setup {
            ls = {
                lua_ls = {
                    arguments_hl = "@comment",
                },
                gopls = {
                    align_type_to_right = true,
                    add_colon_before_type = false,
                    preserve_type_when_truncate = true,
                },
                ts_ls = {
                    extra_info_hl = "@comment",
                },
                vtsls = {
                    extra_info_hl = "@comment",
                },
                ["rust-analyzer"] = {
                    extra_info_hl = "@comment",
                    align_type_to_right = true,
                    preserve_type_when_truncate = true,
                },
                clangd = {
                    extra_info_hl = "@comment",
                    align_type_to_right = true,
                    import_dot_hl = "@comment",
                    preserve_type_when_truncate = true,
                },
                zls = {
                    align_type_to_right = true,
                },
                roslyn = {
                    extra_info_hl = "@comment",
                },
                dartls = {
                    extra_info_hl = "@comment",
                },
                basedpyright = {
                    extra_info_hl = "@comment",
                },
                fallback = true,
                fallback_extra_info_hl = "@comment",
            },
            fallback_highlight = "@variable",
            -- If provided, the plugin truncates the final displayed text to
            -- this width (measured in display cells). Any highlights that extend
            -- beyond the truncation point are ignored. When set to a float
            -- between 0 and 1, it'll be treated as percentage of the width of
            -- the window: math.floor(max_width * vim.api.nvim_win_get_width(0))
            -- Default 60.
            max_width = 60,
        }
    end,
}
