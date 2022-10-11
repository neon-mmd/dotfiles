local status, tree = pcall(require, "nvim-tree")
if not status then
	vim.notify("ERROR: nvim-tree not found!!")
	return
end

tree.setup({
	hijack_cursor = true,
	sort_by = "case_sensitive",
	view = {
		adaptive_size = true,
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
			},
		},
	},
	renderer = {
		group_empty = true,
		highlight_opened_files = "name",
		special_files = {
			"Cargo.toml",
			"Makefile",
			"README.md",
			"readme.md",
			"README.org",
			"readme.org",
			"README.rst",
			"readme.rst",
			"profile.json",
			"package.json",
			"package-lock.json",
		},
	},
	filters = {
		dotfiles = true,
	},
})