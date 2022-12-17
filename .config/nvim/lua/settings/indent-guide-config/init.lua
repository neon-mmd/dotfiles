local status, indent_blankline = pcall(require, "indent_blankline")
if not status then
	vim.notify("ERROR: indent_blankline not found!!")
	return
end

indent_blankline.setup({
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
})
