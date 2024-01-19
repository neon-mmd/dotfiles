local status, comment_box = pcall(require, "comment-box")
if not status then
	vim.notify("ERROR: noice not found!!")
	return
end

comment_box.setup()
