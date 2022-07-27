local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
    return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
    [[ d8b   db d88888b  .d88b.  db    db d888888b .88b  d88. ]],
    [[ 888o  88 88'     .8P  Y8. 88    88   `88'   88'YbdP`88 ]],
    [[ 88V8o 88 88ooooo 88    88 Y8    8P    88    88  88  88 ]],
    [[ 88 V8o88 88~~~~~ 88    88 `8b  d8'    88    88  88  88 ]],
    [[ 88  V888 88.     `8b  d8'  `8bd8'    .88.   88  88  88 ]],
    [[ VP   V8P Y88888P  `Y88P'     YP    Y888888P YP  YP  YP ]],
}
dashboard.section.buttons.val = {
    dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
    dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
    dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
    dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
    dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
    dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
    local randomFooterText = { "Vim is great!!!"
        , "Why Vi use Vim!"
        , "Vim -- Vi improved!"
        , "Vim is awesome"
        , "I love Vim"
        , "Vi made easy!"
        , "Other text editors are nuts!!!"
    }

    return randomFooterText[math.random(1, #randomFooterText)]
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)