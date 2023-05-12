local function os_capture(cmd)
	local f = assert(io.popen(cmd, "r"))
	local s = assert(f:read("*a"))
	f:close()
	s = string.gsub(s, "^%s+", "")
	s = string.gsub(s, "%s+$", "")
	s = string.gsub(s, "[\n\r]+", " ")
	return s
end

local bootstrap = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = bootstrap()

local status, packer = pcall(require, "packer")

if not status then
	vim.notify("ERROR: Packer not found!!")
	return
end

packer.init({
	enable = true,
	threshold = 0,
	max_jobs = tonumber(os_capture("nproc")),
	display = {},
	autoremove = true,
	auto_clean = true,
	compile_on_sync = true,
	auto_reload_compiled = true,
	git = {
		clone_timeout = 120,
	},
})

return packer.startup(function(use)
	-- general
	use("wbthomason/packer.nvim") -- package manager for neovim
	use("GustavoPrietoP/doom-themes.nvim") -- doom themes for neovim
	use({ "catppuccin/nvim", as = "catppuccin" }) -- catppuccin theme for neovim
	use("nvim-lua/popup.nvim") -- popup api for neovim to improve popups
	use("nvim-lua/plenary.nvim") -- plenary to provide vim apis
	use("kyazdani42/nvim-web-devicons") -- for icons
	use({ "kyazdani42/nvim-tree.lua", tag = "nightly" })

	-- lsp
	use({
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	})
	use("neovim/nvim-lspconfig")
	use({
		"williamboman/mason.nvim",
		run = ":MasonUpdate", -- :MasonUpdate updates registry contents
	})
	use("williamboman/mason-lspconfig.nvim")
	use("WhoIsSethDaniel/mason-tool-installer.nvim")

	-- autocompletions
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use("saadparwaiz1/cmp_luasnip")

	-- asthetics
	use("rcarriga/nvim-notify")
	use("nvim-lualine/lualine.nvim")
	use("norcalli/nvim-colorizer.lua")
	use({
		"lewis6991/gitsigns.nvim",
		tag = "release",
	})
	use({ "kevinhwang91/nvim-bqf" })
	use("onsails/lspkind.nvim")
	use("David-Kunz/markid")

	-- beautify code
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-refactor")
	use("HiPhish/nvim-ts-rainbow2")

	-- comment toggler
	use("terrortylor/nvim-comment")

	-- snippets for autocompletions
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

	-- which-key
	use("folke/which-key.nvim")

	-- fancy dashboard for neovim
	use("goolord/alpha-nvim")

	-- automatically close brackets
	use("windwp/nvim-autopairs")

	-- productivity
	use("levouh/tint.nvim")
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-project.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	use("TimUntersberger/neogit")
	use("lewis6991/impatient.nvim")
	use("folke/todo-comments.nvim")
	use("windwp/nvim-ts-autotag")
	use("Pocco81/auto-save.nvim")
	use({ "glepnir/lspsaga.nvim", branch = "main" })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("nvim-orgmode/orgmode")
	use("ziontee113/color-picker.nvim")
	use("rmagatti/auto-session")
	use("rmagatti/session-lens")
	use("lukas-reineke/indent-blankline.nvim")
	use("j-hui/fidget.nvim")
	use("RRethy/vim-illuminate")
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})
	-- smjonas/live-command.nvim

	-- terminal in neovim
	use("akinsho/toggleterm.nvim")

	if packer_bootstrap then
		packer.sync()
	else
		packer.install()
	end
end)
