local status, auto_session = pcall(require, "auto-session")

if not status then
	vim.notify("ERROR: auto_session not found!!")
	return
end

auto_session.setup({
	log_level = "error",
	auto_session_enable_last_session = false,
	auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
	auto_session_enabled = true,
	auto_save_enabled = false,
	auto_restore_enabled = false,
	auto_session_suppress_dirs = false,
	auto_session_use_git_branch = false,
	bypass_session_save_file_types = false,
})
