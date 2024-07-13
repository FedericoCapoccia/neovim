return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "moon",
        transparent = true
      })
      vim.cmd.colorscheme("tokyonight")
    end
  }
}
