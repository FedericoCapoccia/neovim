require "configs"

vim.o.background = "dark"
vim.cmd "colorscheme rose-pine"
vim.api.nvim_set_hl(0, "@lsp.type.inlayHint", { fg = "#aaaaaa", bg = "NONE", italic = true })
vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#888888", bg = "NONE", italic = true })

-- vim.api.nvim_set_hl(0, "SnacksPickerDir", { link = "GruvboxGray" })
-- vim.api.nvim_set_hl(0, "SnacksPickerPathHidden", { link = "GruvboxGray" })
-- vim.api.nvim_set_hl(0, "SnacksPickerGitStatusUntracked", { link = "GruvboxGray" })

-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
-- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE" })

-- vim.opt.pumblend = 0
-- vim.cmd [[
--   highlight Pmenu guibg=none
-- ]]

require "configs.lsp"
