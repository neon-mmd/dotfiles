local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    vim.notify("ERROR: lsp_installer not found!!")
	return
end

local status,lspconfig = pcall(require,"lspconfig")

if not status then
    vim.notify("ERROR: lspconfig not found!!")
    return
end

local servers = { "pylsp", "sumneko_lua","clangd", "rust_analyzer", "denols", "jdtls", "cssls", "html", "bashls" }

lsp_installer.setup({
	ensure_installed = servers,
})

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("settings.lsp.handlers").on_attach,
		capabilities = require("settings.lsp.handlers").capabilities,
	}
	lspconfig[server].setup(opts)
end
