local status, bufferline = pcall(require,'bufferline')

if not status then
    vim.notfiy("ERROR: bufferline not found!!")
    return
end

bufferline.setup {
  animation = false,
  auto_hide = false,
  tabpages = false,
  closable = true,
  clickable = false,

  -- Excludes buffers from the tabline
  -- exclude_ft = {'javascript'},
  -- exclude_name = {'package.json'},
  icons = true,

  -- Configure icons on the bufferline.
  icon_separator_active = '▎',
  icon_separator_inactive = '▎',
  icon_close_tab = '✓',
  icon_close_tab_modified = '●',
  icon_pinned = '車',
  maximum_padding = 1,
  maximum_length = 30,
  semantic_letters = true,
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
  no_name_title = nil,
}
