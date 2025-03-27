return {
    cmd = { "cmake-language-server" },
    root_markers = { "CMakePresets.json", "CTestConfig.cmake", ".git", "build", "cmake" },
    filetypes = { "cmake" },
    single_file_support = true,
    init_options = {
        buildDirectory = "build",
    },
}
