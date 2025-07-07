require("nvchad.configs.lspconfig").defaults()
local lspconfig = require("lspconfig")
lspconfig.clangd.setup(
  {
    cmd = {
      "clangd",
      "--clang-tidy",
      "--background-index",
      "--pch-storage=memory",
      "--header-insertion=never",
    }
  }
)
local servers = { "pyright" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
