local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    opts = {buffer=0}
    opts = {buffer=0, border="single"}
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", opts)
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
local flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

require'lspconfig'.pyright.setup{
  capabilities = capabilities,
  on_attach = on_attach,
  flags = flags
}

-- require'lspconfig'.sourcekit.setup{
--     capabilities = capabilities,
--     on_attach = on_attach,
--     flags = flags
-- }
require'lspconfig'.clangd.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags = flags
}
require'lspconfig'.metals.setup{
  capabilities = capabilities,
  on_attach = on_attach,
  flags = flags
}

require('lspconfig')['rust_analyzer'].setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags = flags,

    settings = {
      ["rust-analyzer"] = {}
    }
}

-- require('lspkind').init({
--     -- DEPRECATED (use mode instead): enables text annotations
--     --
--     -- default: true
--     -- with_text = true,
--
--     -- defines how annotations are shown
--     -- default: symbol
--     -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
--     mode = 'symbol_text',
--
--     -- default symbol map
--     -- can be either 'default' (requires nerd-fonts font) or
--     -- 'codicons' for codicon preset (requires vscode-codicons font)
--     --
--     -- default: 'default'
--     preset = 'default',
--
--     -- override preset symbols
--     --
--     -- default: {}
--     symbol_map = {},
-- })
--
-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
	},
	update_in_insert = true,
	-- underline = true,
	severity_sort = true,
	float = {
		source = "always", -- Or "if_many"
		focusable = false,
		style = "minimal",
		border = "rounded",
		header = "",
		prefix = "",
	},
})
