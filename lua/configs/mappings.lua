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

return M
