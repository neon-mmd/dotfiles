local status_ok, mason_installer = pcall(require, "mason-lspconfig")
if not status_ok then
	vim.notify("ERROR: mason-lspconfig not found!!")
	return
end

local status, lspconfig = pcall(require, "lspconfig")

if not status then
	vim.notify("ERROR: lspconfig not found!!")
	return
end

local servers = { "pyright", "sumneko_lua", "clangd", "rust_analyzer", "denols", "jdtls", "cssls", "html", "bashls" }

mason_installer.setup({
	ensure_installed = servers,
})

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("settings.lsp.handlers").on_attach,
		capabilities = require("settings.lsp.handlers").capabilities,
	}
	lspconfig[server].setup(opts)
end
