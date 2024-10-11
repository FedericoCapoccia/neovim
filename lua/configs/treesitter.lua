pcall(function()
    dofile(vim.g.base46_cache .. "syntax")
    dofile(vim.g.base46_cache .. "treesitter")
end)

return {
    ensure_installed = {
        "bash",
        "c",
        "cpp",
        "cmake",
        "lua",
    },

    highlight = {
        enable = true,
        use_languagetree = true,
    },

    indent = { enable = true }
}
