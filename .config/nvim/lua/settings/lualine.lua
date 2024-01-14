local status, lualine = pcall(require, "lualine")
if not status then
	vim.notify("ERROR: lualine not found!!")
	return
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = "", -- { left = '', right = ''},
		section_separators = "", -- { left = '', right = ''},
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			{
				"filetype",
				colored = true,
				icon_only = true,
				icon = { align = "left" },
			},
		},
		lualine_c = {
			{
				"filename",
				file_status = true, -- Displays file status (readonly status, modified status)
				newfile_status = false, -- Display new file status (new file means no write after created)
				path = 1, -- 0: Just the filename
				-- 1: Relative path
				-- 2: Absolute path
				-- 3: Absolute path, with tilde as the home directory

				shorting_target = 40, -- Shortens path to leave 40 spaces in the window
				-- for other components. (terrible name, any suggestions?)
				symbols = {
					modified = "  ", -- Text to show when the file is modified.
					readonly = "  ", -- Text to show when the file is non-modifiable or readonly.
					unnamed = " ? ", -- Text to show for unnamed buffers.
					newfile = " ", -- Text to show for new created file before first writting
				},
			},
		},
		lualine_x = { require("auto-session").current_session_name },
		lualine_y = { "branch" },
		lualine_z = { "diagnostics" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
