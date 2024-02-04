return {
	cmd = {
		"clangd",
		"--background-index",
		"--suggest-missing-includes",
		"--pch-storage=memory",
		"--clang-tidy",
		"--completion-style=detailed",
	},
	filetypes = { "c", "cpp", "objc", "objcpp" },
}
