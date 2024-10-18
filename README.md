<h1 align="center"> My Neovim Config</h1>

This is my custom neovim configuration that I use regurarly when working on my projects

## Themes
Currently the following colorschemes are available and you can change the default one by editing the main `init.lua` file

- [rose-pine](https://github.com/rose-pine/neovim)
- [onedark](https://github.com/navarasu/onedark.nvim)

## Plugins
I aim not to not overload my configuration with too much plugins, so I provide those that, in my opinion, are essential. <br>
Everything is powered by [lazy.nvim](https://github.com/folke/lazy.nvim)

- [lualine](https://github.com/nvim-lualine/lualine.nvim)
- [bufferline](https://github.com/akinsho/bufferline.nvim)
- [bufdelete](https://github.com/famiu/bufdelete.nvim) // this is needed so I can gracefully close buffers instead of arguing with the default neovim API
- [dressing](https://github.com/stevearc/dressing.nvim) // nicer overall neovim UI
- [gitsigns](https://github.com/lewis6991/gitsigns.nvim)
- [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim) // I am still figuring out if I like it or not
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [telescope](https://github.com/nvim-telescope/telescope.nvim)
- [colorizer](https://github.com/norcalli/nvim-colorizer.lua)
- [peek](https://github.com/toppair/peek.nvim) // a markdown previewer, I am not sure if I should keep it in because it requires Deno (the js runtime) to be installed
- [toggleterm](https://github.com/akinsho/toggleterm.nvim)
- [cmp](https://github.com/hrsh7th/nvim-cmp)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [conform](https://github.com/stevearc/conform.nvim)
- [todo-comments](https://github.com/folke/todo-comments.nvim) // don't be like me, you need to insert a colon after the keyword...
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs)

## Mappings
All the mappings (except for cmp) are all packed together in `lua/configs/mappings.lua` and they get called on plugin initialization

## Languages
Out of the box I provide configuration for few languages:
- C/C++ with clangd and support for .clang-tidy and .clang-format files
- Lua with lua_language_server and stylua
- Rust with a default rust_analyzer setup
- Java with a custom plugin I grabbed from the internet

Adding new languages shouldn't be too hard, just look at the files already present in `lua/configs/lang`, it's not the cleanest solution and it will be refactored in the future but it works, you just need to create your own file and call it in the `lspconfig` plugin directory

## Future additions
### Debugger: <br>
Maybe in the future but it's not a priority yet. (Yeah I am a println guy, now you can insult me).

### Harpoon
Maybe in the future aswell
