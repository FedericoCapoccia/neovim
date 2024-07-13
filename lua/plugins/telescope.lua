return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.6",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons"
  },

  config = function()
    require("telescope").setup({})
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>pf", builtin.find_files)
    vim.keymap.set("n", "<leader>ps", builtin.live_grep)
    vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})
  end
}
