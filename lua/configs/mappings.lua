local map = vim.keymap.set

local M = {}

M.vanilla = function()
    map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })
    map("n", "<leader>ww", "<cmd>w<CR>", { desc = "general save file" })
    map("n", "<leader>qq", "<cmd>qa!<CR>", { desc = "force quit" })
    map("x", "p", "P")
    map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
    map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

    map('n', "<Tab>", "<cmd> :bnext <cr>", { desc = "next buffer", remap = true })
    map('n', "<S-Tab>", "<cmd> :bprevious <cr>", { desc = "previous buffer", remap = true })
end

M.nvimtree = function()
    map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
    map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })
end

return M
