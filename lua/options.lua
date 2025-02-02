-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
vim.wo.number = true
-- Set relative numbered lines
vim.o.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true

-- Smart case
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Time to wait for a mapped sequence to complete (in milliseconds)
vim.o.timeoutlen = 300

-- Creates a backup file
vim.o.backup = false

-- If a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.o.writebackup = false

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menu,menuone,noselect'

-- Set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- Which "horizontal" keys are allowed to travel to prev/next line
vim.o.whichwrap = 'bs<>[]hl'

-- Wrap long line
vim.o.wrap = false

-- Companion to wrap don't split words
vim.o.linebreak = true

-- Minimal number of screen lines to keep above and below the cursor
vim.o.scrolloff = 10

-- Minimal number of screen columns either side of cursor if wrap is `false`
vim.o.sidescrolloff = 8

-- Set number column width to 2 {default 4}
vim.o.numberwidth = 2

-- The number of spaces inserted for each indentation
vim.o.shiftwidth = 2

-- Insert n spaces for a tab
vim.o.tabstop = 2

-- Number of spaces that a tab counts for while performing editing operations
vim.o.softtabstop = 2

-- Convert tabs to spaces
vim.o.expandtab = true

-- Highlight the current line
vim.o.cursorline = true

-- Force all horizontal splits to go below current window
vim.o.splitbelow = true

-- Force all vertical splits to go to the right of current window
vim.o.splitright = true

-- Creates a swapfile
vim.o.swapfile = false

-- Make indenting smarter again
vim.o.smartindent = true

-- We don't need to see things like -- INSERT -- anymore
vim.o.showmode = false

-- Always show tabs
vim.o.showtabline = 2

-- Allow backspace on
vim.o.backspace = 'indent,eol,start'

-- Pop up menu height
vim.o.pumheight = 10

-- So that is visible in markdown files
vim.o.conceallevel = 2

vim.o.fileencodings = 'utf-8,cp1251,koi8-r' -- the encoding written to a file

-- More space in the neovim command line for displaying messages
vim.o.cmdheight = 1

-- Copy indent from current line when starting new one
vim.o.autoindent = true

-- Don't give |ins-completion-menu| messages
vim.opt.shortmess:append 'c'

vim.opt.iskeyword:append '-' -- hyphenated words recognized by searches

-- Don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
vim.opt.formatoptions:remove { 'c', 'r', 'o' }

-- Separate vim plugins from neovim in case vim still in use
vim.opt.runtimepath:remove '/usr/share/vim/vimfiles'

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Remove unnecessary spaces at the end of lines
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = function()
    vim.cmd [[%s/\s\+$//e]]
  end,
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Spell check
vim.opt.spell = true
vim.opt.spelllang = { 'en', 'ru' }

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'terminal', 'help', 'nofile', 'quickfix', 'prompt', 'dashboard', 'neo-tree' },
  callback = function()
    vim.opt_local.spell = false
  end,
})

-- Cyrillic language map
local function escape(str)
  -- You need to escape these characters to work correctly
  local escape_chars = [[;,."|\]]
  return vim.fn.escape(str, escape_chars)
end

-- Recommended to use lua template string
local en = [[`qwertyuiop[]asdfghjkl;'zxcvbnm]]
local ru = [[ёйцукенгшщзхъфывапролджэячсмить]]
local en_shift = [[~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>]]
local ru_shift = [[ËЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ]]

vim.opt.langmap = vim.fn.join({
  -- | `to` should be first     | `from` should be second
  escape(ru_shift)
    .. ';'
    .. escape(en_shift),
  escape(ru) .. ';' .. escape(en),
}, ',')

-- Folding settings
-- vim.o.foldenable = false

-- vim.api.nvim_create_autocmd({ 'FileType' }, {
--   callback = function()
--     if require('nvim-treesitter.parsers').has_parser() then
--       vim.opt.foldmethod = 'expr'
--       vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
--     else
--       vim.opt.foldmethod = 'syntax'
--     end
--   end,
-- })

-- Terminal settings
vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})
