local status, icon_picker = pcall(require, "icon-picker")
if not status then
	vim.notify("ERROR: icon-picker not found!!")
	return
end

icon_picker.setup({ disable_legacy_commands = true })
