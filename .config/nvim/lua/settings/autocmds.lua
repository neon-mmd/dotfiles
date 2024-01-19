-- run PackerSync when plugins.lua changes
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | lazy sync
--   augroup end
-- ]])

-- reload my config on changes
vim.cmd([[
  augroup reload_configs
    autocmd!
    autocmd BufWritePost init.lua source <afile>
  augroup end
]])

-- add refactor extension on treesitter
vim.cmd([[
  augroup reload_configs
    autocmd!
    autocmd BufEnter * TSEnable refactor
  augroup end
]])

-- add rainbow paranthesis to buffers
vim.cmd([[
  augroup reload_configs
    autocmd!
    autocmd BufEnter * TSEnable rainbow
  augroup end
]])

-- add markid extension on treesitter
vim.cmd([[
  augroup reload_configs
    autocmd!
    autocmd BufEnter * TSEnable markid
  augroup end
]])
