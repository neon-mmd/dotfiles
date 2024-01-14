_G.__luacache_config = {
    chunks = {
        enable = true,
        path = vim.fn.stdpath("cache") .. "/luacache_chunks",
    },
    modpaths = {
        enable = true,
        path = vim.fn.stdpath("cache") .. "/luacache_modpaths",
    },
}

local status, _ = pcall(require, "impatient")
if not status then
    vim.notify("ERROR: impatient not found!!")
    return
end
