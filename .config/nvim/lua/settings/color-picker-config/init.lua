local status, color_picker = pcall(require, "color-picker")
if not status then
    vim.notify("ERROR: ccc.nvim not found!!")
    return
end

color_picker.setup({
    -- ["icons"] = { "ﱢ", "" },
    -- ["icons"] = { "ﮊ", "" },
    -- ["icons"] = { "", "ﰕ" },
    -- ["icons"] = { "", "" },
    -- ["icons"] = { "", "" },
    ["icons"] = { "ﱢ", "" },
    ["border"] = "single", -- none | single | double | rounded | solid | shadow
    ["background_highlight_group"] = "Normal", -- default
    ["border_highlight_group"] = "FloatBorder", -- default
    ["text_highlight_group"] = "Normal", --default
})
