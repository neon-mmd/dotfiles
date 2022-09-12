local status, orgmode = pcall(require, "orgmode")

if not status then
	vim.notify("ERROR: orgmode not found!!")
	return
end

orgmode.setup_ts_grammar()

orgmode.setup({
	org_agenda_files = { "~/rest/sheduledTasks/tasks.org" },
})
