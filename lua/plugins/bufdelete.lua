return {
  "famiu/bufdelete.nvim",
  init = function()
    vim.keymap.set("n", "<leader>x", "<cmd> Bdelete<CR>", { noremap = true, silent = true, desc = "Delete Buffer" })
  end,
}
