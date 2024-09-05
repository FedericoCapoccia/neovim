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
          sidebars = "transparent",
        },
      })
    end,
  },
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "darker",
        transparent = true,
        lualine = {
          transparent = true,
        },
      })
      require("onedark").load()
      vim.cmd.colorscheme("onedark")
    end,
  },
}
