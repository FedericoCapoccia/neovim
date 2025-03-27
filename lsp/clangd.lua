return {
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
        -- "--experimental-modules-support",
    },
    -- init_options = {
    -- fallbackFlags = { "-std=c++23" },
    -- },
    root_markers = {
        '.clangd',
        '.clang-tidy',
        '.clang-format',
        'compile_commands.json',
        'compile_flags.txt',
        'configure.ac', -- AutoTools
    },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
    capabilities = {
        textDocument = {
            completion = {
                editsNearCursor = true,
            },
        },
        offsetEncoding = { 'utf-8', 'utf-16' },
    },
}
