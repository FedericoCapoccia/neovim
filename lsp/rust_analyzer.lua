return {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },

    root_markers = {
        '.git',
    },

    capabilities = {
        experimental = {
            serverStatusNotification = true,
        },
    },

    settings = {
        ["rust-analyzer"] = {
            completion = {
                callable = {
                    snippets = "none", -- Disable function argument placeholders
                },
            },
            inlayHints = {
                typeHints = false,
            },
        },
    },

}
