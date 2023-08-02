local actions = require("telescope.actions")
require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      n = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        --["<C-p>"] = require("telescope.builtin").find_files({noremap = true, silent = true}),
        -- ["<C-/>"] = require("telescope.builtin").find_files(),
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}
local builtin = require('telescope.builtin')
local keymap = vim.keymap

-- keymap.set('n', '<C-p>', builtin.find_files(require('telescope.themes').get_ivy({})))
-- keymap.set('n', '<C-p>', builtin.find_files, {})
keymap.set('n', '<leader>sf', builtin.find_files, {})
keymap.set('n', '<leader>sw', builtin.live_grep, {})
keymap.set('n', '<leader>sb', builtin.buffers, {})
keymap.set('n', '<leader>ggf', builtin.git_files, {})
keymap.set('n', '<leader>ggc', builtin.git_commits, {})
keymap.set('n', '<leader>ggb', builtin.git_branches, {})
keymap.set('n', '<C-_>', ':lua require("telescope.builtin").current_buffer_fuzzy_find()<cr>')
keymap.set('n', '<leader>pf', function()
  builtin.grep_string({search = vim.fn.input("Grep > ")});
end)
-- vim.keymap.set('n', '<leader>ff', function()
--   -- You can pass additional configuration to telescope to change theme, layout, etc.
--     builtin.find_files(require('telescope.themes').get_dropdown {
--     -- winblend = 10,
--     -- previewer = false,
--   })
-- end, {})
--keymap.set('n', '<C-/>', require('telescope.builtin').current_buffer_fuzzy_find(), {})

