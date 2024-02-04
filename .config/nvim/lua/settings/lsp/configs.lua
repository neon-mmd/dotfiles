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

local servers = { "pyright", "lua_ls", "clangd", "rust_analyzer", "tsserver", "jdtls", "cssls", "html", "bashls" }

mason_installer.setup({
	ensure_installed = servers,
})

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("settings.lsp.handlers").on_attach,
		capabilities = require("settings.lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "settings.lsp.server-settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end
	lspconfig[server].setup(opts)
end
