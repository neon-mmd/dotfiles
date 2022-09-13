local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    vim.notify("ERROR: lspconfig not found!!")
  return
end

require("settings.lsp.configs")
require("settings.lsp.handlers").setup()
require("settings.lsp.null-ls")
