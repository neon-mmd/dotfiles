local status, git_conflict = pcall(require, "git-conflict")
if not status then
	vim.notify("ERROR: gitsigns not found!!")
	return
end

git_conflict.setup()
