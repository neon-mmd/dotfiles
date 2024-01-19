local status, wilder = pcall(require, "wilder")
if not status then
	vim.notify("ERROR: which-key not found!!")
	return
end

wilder.setup({ modes = { ":", "/", "?" } })
