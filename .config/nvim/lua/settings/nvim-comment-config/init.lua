local status,comment = pcall(require,"nvim_comment")
if not status then
    vim.notify("ERROR: nvim_comment not found!!")
    return
end

comment.setup(
    {
     comment_empty = false,
     comment_empty_trim_whitespace = false,
    }
)
