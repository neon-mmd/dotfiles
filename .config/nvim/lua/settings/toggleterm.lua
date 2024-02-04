local status, term = pcall(require, "toggleterm")
if not status then
	vim.notify("ERROR: toggleterm not found!!")
	return
end

term.setup({
	size = 10,
	shade_terminals = true,
	shading_factor = "1",
	start_in_insert = true,
	persist_size = true,
	direction = "horizontal",
	close_on_exit = true,
	shell = vim.o.shell,
	insert_mappings = true,
	terminal_mappings = true,
})
