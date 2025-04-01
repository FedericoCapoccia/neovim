return {
    cmd = { "zls" },
    root_markers = { "zls.json", "build.zig", ".git" },
    filetypes = { "zig", "zir" },
    settings = {
        single_file_support = true,
        semantic_tokens = "partial",
        enable_argument_placeholders = false,
        enable_build_on_save = true,
    },
}
