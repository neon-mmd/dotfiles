local status, mason_tool_installer = pcall(require, "mason-tool-installer")
if not status then
	vim.notify("ERROR: mason-tool-installer not found!!")
	return
end

mason_tool_installer.setup({

	ensure_installed = {
		"stylua",
		"shfmt",
		"black",
		"prettier",
		"flake8",
		"clang-format",
	},
	auto_update = true,

	run_on_start = true,

	start_delay = 3000, -- 3 second delay
})
