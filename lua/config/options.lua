-- Indenting
vim.opt.tabstop = 8
vim.opt.softtabstop = -1
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Line numbers
vim.opt.relativenumber = true
vim.opt.number = true

-- Undo and swap stuff
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- Highlight and search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- System
vim.opt.mouse = "a"
vim.opt.updatetime = 250
vim.opt.colorcolumn = "120"
vim.opt.breakindent = true

-- Use system cliboard if not in SSH
if not vim.env.SSH_TTY then
  vim.opt.clipboard = "unnamedplus"
end

-- Providers
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- Other
vim.g.markdown_recommended_style = 0
vim.g.have_nerd_font = true

-- Automatically set tabs for Makefiles
vim.api.nvim_create_autocmd("FileType", {
  pattern = "make",
  callback = function()
    vim.opt_local.expandtab = false -- Use tabs, not spaces
    vim.opt_local.shiftwidth = 8 -- Use 8 spaces per tab (standard for Makefiles)
    vim.opt_local.softtabstop = 0 -- Use actual tabs
    vim.opt_local.tabstop = 8 -- Display tabs as 8 spaces
  end,
})
