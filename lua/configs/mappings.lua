local map = vim.keymap.set

local M = {}

M.vanilla = function()
    map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })
    map("n", "<leader>ww", "<cmd>w<CR>", { desc = "general save file" })
    map("n", "<leader>qq", "<cmd>qa!<CR>", { desc = "force quit" })
    map("x", "p", "P")
    map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
    map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })
end

M.bufferline = function()
    map("n", "<tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "buffer goto next" })
    map("n", "<S-tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "buffer goto previous" })
    map("n", "<leader>x", function()
        require("bufdelete").bufdelete(0)
    end, { desc = "buffer goto previous" })
end

M.telescope = function()
    map("n", "<leader>pf", "<cmd>Telescope find_files<CR>", { desc = "telescope find files" })
    map("n", "<leader>ps", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in buffer" })
    map("n", "<leader>pc", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
    map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
end

M.nvimtree = function()
    map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
    map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })
end

M.lsp_defaults = function(_, bufnr)
    local function opts(desc)
        return { buffer = bufnr, desc = "LSP " .. desc, noremap = true }
    end

    map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
    map("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
    map("n", "gi", vim.lsp.buf.implementation, opts "Go to implementation")
    map("n", "<leader>sh", vim.lsp.buf.signature_help, opts "Show signature help")
    map("n", "<leader>sd", vim.lsp.buf.hover, opts "Hover documentation")
    map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Go to type definition")
    map("n", "<f2>", vim.lsp.buf.rename, opts "Rename")
    map({ "n", "v" }, "<C-Space>", vim.lsp.buf.code_action, opts "Code action")

    map("n", "<leader>ff", function()
        require("conform").format { async = true, lsp_fallback = true }
    end, opts "Formatter")

    map("n", "<leader>ll", function()
        require("lint").try_lint()
    end, opts "Linter")

    map("n", "<A-o>", "<cmd>ClangdSwitchSourceHeader<CR>", opts "Switch source header")
end

return M
