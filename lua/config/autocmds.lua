-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`
-- Autosave on InsertLeave, TextChanged, FocusLost
vim.api.nvim_create_autocmd({ 'FocusLost' }, {
  desc = 'Auto save on lost focus',
  pattern = '*',
  group = vim.api.nvim_create_augroup('custom-autocmds', { clear = true }),
  command = 'silent! update',
  nested = true,
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('custom-autocmds', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.notify("Loading nvim.autocommands success", vim.log.levels.INFO)