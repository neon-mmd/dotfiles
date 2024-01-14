local status_ok, lsp_lines = pcall(require, "lsp_lines")
if not status_ok then
	vim.notify("ERROR: lsp_lines not found!!")
	return
end

lsp_lines.setup()
