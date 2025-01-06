vim.api.nvim_create_augroup('black_on_save', {
    clear = true
})
vim.api.nvim_create_autocmd({"BufWritePre"}, {
    group = "black_on_save",
    pattern = ".py",
    command = "Black",
})
