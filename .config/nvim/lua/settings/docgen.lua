local status, neogen = pcall(require, "neogen")
if not status then
	vim.notify("ERROR: neogen not found!!")
	return
end

neogen.setup({ snippet_engine = "luasnip" })
