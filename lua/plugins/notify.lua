return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({
      background_colour = "#000000",
      render = "minimal",
      top_down = false,
      stages = "fade",
    })
  end,
}
