-- Indenting
vim.opt.tabstop = 8
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Use system cliboard if not in SSH
if not vim.env.SSH_TTY then
  vim.opt.clipboard = 'unnamedplus'
end

-- Providers
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- Other
vim.g.markdown_recommended_style = 0
vim.g.have_nerd_font = true
