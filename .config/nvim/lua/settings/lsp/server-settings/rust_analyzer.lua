return {
	cargo = {
		autoreload = true,
		sysroot = ".",
		features = "all",
	},
	checkOnSave = {
		command = "clippy",
		features = "all",
	},
	check = {
		features = "all",
		allTargets = true,
	},
}
