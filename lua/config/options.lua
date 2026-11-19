-- [[ Setting options ]]
-- See `:help vim.o`

-- Disable shada (SHAred DAta) file to prevent storing session data between Neovim sessions
-- This improves startup speed but loses marks, registers, command history, etc.
vim.o.shada = ''

-- Make line numbers default
vim.o.number = true
vim.o.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
vim.schedule(function()
    vim.o.clipboard = 'unnamedplus'
end)

-- Keep indentation when wrapping lines, making wrapped text align with original indentation
-- Useful for long comments, documentation, or code lines that exceed window width
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Always show the sign column (gutter) to prevent layout shifting when signs appear
-- Signs include: LSP diagnostics, Git signs, breakpoints, etc.
vim.wo.signcolumn = 'yes'

-- Reduce time (ms) before swapfile writes and CursorHold events trigger
-- Affects: LSP hover, diagnostic display, autosave, etc.
vim.o.updatetime = 250

-- Time (ms) to wait for mapped key sequences to complete
-- Example: Pressing '<leader>' then waiting for next key in sequence
vim.o.timeoutlen = 1000

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type
vim.o.inccommand = 'nosplit'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
vim.o.confirm = true

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

vim.notify('Loading nvim.options success', vim.log.levels.INFO)
