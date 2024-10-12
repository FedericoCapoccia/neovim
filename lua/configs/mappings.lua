local map = vim.keymap.set

-- General
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })
map("n", "<leader>ww", "<cmd>w<CR>", { desc = "general save file" })
map("n", "<leader>qq", "<cmd>q!<CR>", { desc = "force quit" })

-- Tabufline
map("n", "<tab>", function()
    require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })
map("n", "<S-tab>", function()
    require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })
map("n", "<leader>x", function()
    require("nvchad.tabufline").close_buffer()
end, { desc = "buffer close" })

-- Telescope
map("n", "<leader>th", function()
    require("nvchad.themes").open()
end, { desc = "telescope nvchad themes" })
map("n", "<leader>pf", "<cmd>Telescope find_files<CR>", { desc = "telescope find files" })
map("n", "<leader>ps", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in buffer" })
map("n", "<leader>pc", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- NvimTree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })
