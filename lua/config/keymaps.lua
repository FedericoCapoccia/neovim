vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>i", "gg=G<CR>")
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>ww", "<cmd>w!<CR>")
vim.keymap.set("n", "<leader>qq", "<cmd>q!<CR>")
vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>")
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<CR>")
