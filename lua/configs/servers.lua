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
        },
        init_options = {
            fallbackFlags = { "-std=c++23" },
        },
    },
    cmake = {},
    lua_ls = {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
                telemetry = {
                    enable = false,
                },
                workspace = {
                    library = {
                        vim.fn.expand "$VIMRUNTIME/lua",
                        vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
                        vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
                        "${3rd}/luv/library",
                    },
                    maxPreload = 100000,
                    preloadFileSize = 10000,
                },
            },
        },
    },
    rust_analyzer = {},
    pyright = {},
}
