local status, notify = pcall(require, "notify")

if not status then
	vim.notify("ERROR: notify not found!!")
	return
end

notify.setup({
	stages = "fade",
	on_open = nil,
	on_close = nil,
	render = "default",
	timeout = 1,
	background_colour = "Normal",
	minimum_width = 10,
})

vim.notify = notify
