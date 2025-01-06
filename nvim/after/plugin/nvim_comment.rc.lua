local status, comment= pcall(require, 'nvim_comment')
if (not status) then return end
comment.setup {
    opleader = {
        line = "gc",
        block = "gb",
    },
    mapping = {
        basic = true,
        extra = true,
    },
}

