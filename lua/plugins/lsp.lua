local M = {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "j-hui/fidget.nvim",
  },
  config = function()
    require("fidget").setup({})
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    local on_attach = function(_, bufnr)
      local nmap = function(keys, func, desc)
        if desc then
          desc = "LSP: " .. desc
        end
        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
      end

      nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
      nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
      nmap("<leader>ff", "<cmd>lua vim.lsp.buf.format({async=true})<CR>", "[G]oto [D]eclaration")

      -- Documentation
      nmap("K", vim.lsp.buf.hover, "Hover Documentation")
      nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
    end

    local servers = {
      "clangd", "nil_ls"
    }

    for _, lsp in ipairs(servers) do
      require("lspconfig")[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities
      }
    end

    require("lspconfig").lua_ls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
          telemetry = { enable = false },
        },
      }
    }

  end
}

return M
