return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "j-hui/fidget.nvim",
    "stevearc/conform.nvim",
  },
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    -- On Lsp Attach
    local on_attach = function(_, bufnr)
      local nmap = function(keys, func, desc)
        if desc then
          desc = "LSP: " .. desc
        end
        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
      end

      nmap("<C-Space>", vim.lsp.buf.code_action, "[C]ode [A]ction")
      nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
      nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
      nmap("<F2>", vim.lsp.buf.rename, "Rename")

      -- Format
      nmap("<leader>ff", function()
        require("conform").format({ async = true, lsp_fallback = true })
      end, "[F]ormatter")

      -- Documentation
      nmap("K", vim.lsp.buf.hover, "Hover Documentation")
      nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
    end

    local servers = { "clangd", "nil_ls" }

    -- Setup every lsp in servers {}
    for _, lsp in ipairs(servers) do
      require("lspconfig")[lsp].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end

    require("fidget").setup({})
    require("lspconfig").lua_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          telemetry = { enable = false },
        },
      },
    })

    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        nix = { "nixpkgs_fmt" },
        c = { "clang-format" },
        cpp = { "clang-format" },
      },
      format_on_save = { lsp_fallback = true },
    })
  end,
}
