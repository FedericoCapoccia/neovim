local M = {}

M.setup = function()
    require("lint").linters_by_ft = {
        python = { "pylint" },
        rust = { "clippy" },
        cmake = { "cmakelint" },
    }
end

return {
    "mfussenegger/nvim-lint", -- Linter
    config = function()
        M.setup()
    end,
}
