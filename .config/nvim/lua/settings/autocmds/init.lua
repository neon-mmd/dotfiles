-- run PackerSync when plugins.lua changes
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- reload my config on changes
vim.cmd([[
  augroup reload_configs
    autocmd!
    autocmd BufWritePost init.lua source <afile>
  augroup end
]])


