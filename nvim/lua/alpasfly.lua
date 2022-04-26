-- Native LSP
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require'lspconfig'.pyright.setup{
    capabilities = capabilities,
    on_attach = function()
        opts = {buffer=0}
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", opts)
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
    end,
}

vim.opt.completeopt={"menu", "menuone", "noselect"}
local cmp = require'cmp'
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable,
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
    })
})

-- lualine
require('lualine').setup{
  options = {
    theme = 'OceanicNext'
    -- theme = 'catppuccin'
  }
}

-- local catppuccin = require("catppuccin")
-- catppuccin.setup {}
-- vim.cmd[[colorscheme catppuccin]]
vim.cmd[[colorscheme OceanicNext]]
vim.cmd([[set termguicolors]])

-- Comments
require("nvim_comment").setup {
    opleader = {
        line = "gc",
        block = "gb",
    },
    mapping = {
        basic = true,
        extra = true,
    },
}

-- Telescope
local action_state = require('telescope.actions.state')
require('telescope').setup{
    defaults = {
        prompt_prefix = "$ ",
        mappings = {
            i = {
                ["<c-b>"] = function() print(vim.inspect(action_state.get_selected_entry())) end
            }
        }
    }
}


local mappings = {}
mappings.curr_buf = function()
    local opts = require('telescope.themes').get_dropdown({windblend=10})
    require('telescope.builtin').current_buffer_fuzzy_find(opts)
    print("Reloaded!")
end

return mappings
