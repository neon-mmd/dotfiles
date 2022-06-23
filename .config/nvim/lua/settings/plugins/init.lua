vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerSync
  augroup end
]])

local status,_ = pcall(require,'packer')

if not status then
    vim.notify("ERROR: packer.nvim not found!")
    return
end

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- package manager for neovim
    use 'dracula/vim' -- dracula color scheme for neovim
    use "nvim-lua/popup.nvim" -- required
    use "nvim-lua/plenary.nvim" -- required
    use 'kyazdani42/nvim-web-devicons' -- for icons
    use 'kyazdani42/nvim-tree.lua' -- tree like nerd tree in neovim
    
    -- lsp
    use 'neovim/nvim-lspconfig'
    use 'onsails/lspkind.nvim'
    use 'williamboman/nvim-lsp-installer'

    -- autocompletions
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'

    -- asthetics
    use 'rcarriga/nvim-notify'
    use 'nvim-lualine/lualine.nvim'
    use 'romgrk/barbar.nvim'

    -- beautify code
    use {'nvim-treesitter/nvim-treesitter',run = ':TSUpdate'}
    use 'nvim-treesitter/nvim-treesitter-refactor'
    use 'p00f/nvim-ts-rainbow'

    -- comment toggler
    use 'terrortylor/nvim-comment'

    -- snippets for autocompletions
    use "rafamadriz/friendly-snippets"

    -- which-key 
    use 'folke/which-key.nvim'

    -- fancy dashboard for neovim
    use 'goolord/alpha-nvim'

    -- automatically close brackets
    use "windwp/nvim-autopairs"

    if packer_bootstrap then
        require('packer').sync()
    end   
end)
