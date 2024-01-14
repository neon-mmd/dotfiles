local status, neogit = pcall(require, "neogit")
if not status then
	vim.notify("ERROR: neogit not found!!")
	return
end

neogit.setup()
