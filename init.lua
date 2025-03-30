require "configs"

-- vim.cmd "colorscheme onedark"
vim.cmd "colorscheme rose-pine-moon"

-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
-- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
-- vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE" })
--
-- vim.opt.pumblend = 0
-- vim.cmd [[
--   highlight Pmenu guibg=none
-- ]]

require "configs.lsp"
