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

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")

if not status then
    vim.notify("ERROR: Packer not found!!")
    return
end

packer.init({
    enable = true,
    threshold = 0,
    max_jobs = 4,
    display = {},
})

return packer.startup(function(use)
    -- general
    use("wbthomason/packer.nvim") -- package manager for neovim
    use("GustavoPrietoP/doom-themes.nvim") -- doom themes for neovim
    use("nvim-lua/popup.nvim") -- popup api for neovim to improve popups
    use("nvim-lua/plenary.nvim") -- plenary to provide vim apis
    use("kyazdani42/nvim-web-devicons") -- for icons
    use("kyazdani42/nvim-tree.lua") -- tree like nerd tree in neovim

    -- lsp
    use("neovim/nvim-lspconfig")
    use("williamboman/mason.nvim")
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
    use("romgrk/barbar.nvim")
    use("norcalli/nvim-colorizer.lua")
    use({
        "lewis6991/gitsigns.nvim",
        tag = "release",
    })
    use({ "kevinhwang91/nvim-bqf" })
    use("windwp/nvim-spectre")
    use("onsails/lspkind.nvim")
    use("David-Kunz/markid")

    -- beautify code
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use("nvim-treesitter/nvim-treesitter-refactor")
    use("p00f/nvim-ts-rainbow")

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
    use("folke/trouble.nvim")
    use("folke/todo-comments.nvim")
    use("windwp/nvim-ts-autotag")
    use("Pocco81/auto-save.nvim")
    use({ "glepnir/lspsaga.nvim", branch = "main" })
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
    use("nvim-orgmode/orgmode")
    use("uga-rosa/ccc.nvim")

    -- terminal in neovim
    use("akinsho/toggleterm.nvim")

    if packer_bootstrap then
        packer.sync()
    else
        packer.install()
    end
end)
