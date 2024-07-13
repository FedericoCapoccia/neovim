local options = {
  indent = {
    char = '╎',
  }
}

return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
    require("ibl").setup(options)
  end
}
