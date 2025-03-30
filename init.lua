require "configs"

vim.cmd "colorscheme onedark"
-- vim.cmd "colorscheme rose-pine-main"

vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE" })

require "configs.lsp"
