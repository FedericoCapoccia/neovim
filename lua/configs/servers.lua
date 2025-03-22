return {
    clangd = {
        cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--all-scopes-completion",
            "--pch-storage=memory",
            "-j=4",
            "-header-insertion=never",
            "--log=verbose",
            "--pretty",
            "--function-arg-placeholders=0",
        },
        init_options = {
            fallbackFlags = { "-std=c++23" },
        },
    },

    cmake = {},

    lua_ls = {
        server_capabilities = {
            semanticTokensProvider = vim.NIL,
        },
    },

    rust_analyzer = {
        settings = {
            ["rust-analyzer"] = {
                completion = {
                    callable = {
                        snippets = "none", -- Disable function argument placeholders
                    },
                },
            },
        },
    },

    pyright = {},
}
