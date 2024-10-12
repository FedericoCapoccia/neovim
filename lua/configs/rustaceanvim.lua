vim.g.rustaceanvim = {

    server = {
        on_attach = require("configs.lspconfig").on_attach,
    },
}
