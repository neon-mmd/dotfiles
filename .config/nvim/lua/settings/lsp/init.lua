local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("settings.lsp.configs")
require("settings.lsp.handlers").setup()
require("settings.lsp.null-ls")
