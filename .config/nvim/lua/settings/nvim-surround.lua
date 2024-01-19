local status, nvim_surround = pcall(require, "nvim-surround")
if not status then
	vim.notify("Error nvim-surround not found!!", vim.log.levels.ERROR)
	return
end

nvim_surround.setup()
