return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "moon",
        transparent = true,
        styles = {
          floats = "transparent",
          --sidebars = "transparent",
        },
      })
      vim.cmd.colorscheme("tokyonight")
    end
  }
}
