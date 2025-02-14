-- Keymaps

-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- For conciseness
local opts = { noremap = true, silent = true }

-- Disable the space key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Allow moving the cursor through wrapped lines with j, k
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- clear highlights
vim.keymap.set('n', '<Esc>', ':noh<CR>', opts)

-- delete single character without copying into register
vim.keymap.set('n', 'x', '"_x', opts)

-- Resize with arrows
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)

-- Buffers
-- vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
-- vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
-- vim.keymap.set('n', ']t', ':bnext<CR>', { desc = 'Go to next buffer' })
-- vim.keymap.set('n', '[t', ':bprevious<CR>', { desc = 'Go to previous buffer' })
vim.keymap.set('n', '<leader>bk', ':bdelete<CR>', { desc = 'Current buffer kill' })
vim.keymap.set('n', '<leader>bc', ':bdelete<CR>', { desc = 'Current buffer close' })
vim.keymap.set('n', '<leader>bn', '<cmd> enew <CR>', { desc = 'Buffer new' })

-- Window management
vim.keymap.set('n', '<leader>wv', '<C-w>v', { desc = 'Split window vertically' })
vim.keymap.set('n', '<leader>w|', '<C-w>v', { desc = 'Split window vertically' })
vim.keymap.set('n', '<leader>ws', '<C-w>s', { desc = 'Split window horizontally' })
vim.keymap.set('n', '<leader>w_', '<C-w>s', { desc = 'Split window horizontally' })
vim.keymap.set('n', '<leader>w=', '<C-w>=', { desc = 'Make split windows equal width & height' })
vim.keymap.set('n', '<leader>wc', ':close<CR>', { desc = 'Window close current split ' })
vim.keymap.set('n', '<leader>wo', '<C-w>o', { desc = 'Close all other windows' })

-- Navigate between splits
-- vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', { desc = 'Move focus to the up window' })
-- vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', { desc = 'Move focus to the bottom window' })
-- vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-k>', '<cmd>TmuxNavigateUp<CR>', { desc = 'Move focus to the up window' })
vim.keymap.set('n', '<C-j>', '<cmd>TmuxNavigateDown<CR>', { desc = 'Move focus to the bottom window' })
vim.keymap.set('n', '<C-h>', '<cmd>TmuxNavigateLeft<CR>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<cmd>TmuxNavigateRight<CR>', { desc = 'Move focus to the right window' })

vim.keymap.set('n', '<leader>wk', '<cmd>TmuxNavigateUp<CR>', { desc = 'Move focus to the up window' })
vim.keymap.set('n', '<leader>wj', '<cmd>TmuxNavigateDown<CR>', { desc = 'Move focus to the bottom window' })
vim.keymap.set('n', '<leader>wh', '<cmd>TmuxNavigateLeft<CR>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<leader>wl', '<cmd>TmuxNavigateRight<CR>', { desc = 'Move focus to the right window' })

-- Press jk or ол fast to exit insert mode
vim.keymap.set('i', 'jj', '<ESC>', opts)
vim.keymap.set('i', 'оо', '<ESC>', opts)

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

-- Toggle keymaps

-- Toggle diagnostics
local diagnostics_active = true

vim.keymap.set('n', '<leader>td', function()
  diagnostics_active = not diagnostics_active

  if diagnostics_active then
    vim.diagnostic.enable(true)
  else
    vim.diagnostic.enable(false)
  end
end, { desc = 'Toggle diagnostics' })

-- Toggle line wrap
local line_wrapping_flag = false

vim.keymap.set('n', '<leader>tw', function()
  line_wrapping_flag = not line_wrapping_flag

  if line_wrapping_flag then
    vim.o.wrap = true
  else
    vim.o.wrap = false
  end
end, { desc = 'Soft line wrapping' })

-- Toggle conceal level
local conceal_level_flag = true

vim.keymap.set('n', '<leader>tc', function()
  conceal_level_flag = not conceal_level_flag

  if conceal_level_flag then
    vim.o.conceallevel = 2
  else
    vim.o.conceallevel = 0
  end
end, { desc = 'Toggle conceal level' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Reopen file with given encoding
vim.keymap.set('n', '<leader>fr', function()
  local encodings_choice = { '1. utf-8', '2. cp1251', '3. koi8-r', '4. cp866' }
  local encodings = { 'utf-8', 'cp1251', 'koi8-r', 'cp866' }
  local choice = vim.fn.inputlist(encodings_choice)

  if choice > 0 and choice <= #encodings then
    local selected_encoding = encodings[choice]
    vim.cmd('e ++enc=' .. selected_encoding)
    print('\nFile reopened with encoding: ' .. selected_encoding)
  else
    print '\nInvalid choice or canceled'
  end
end, { desc = 'Reopen file with selected encoding' })

-- Exit from terminal
vim.keymap.set('t', 'jk', '<C-\\><C-n>', { noremap = true })

-- Toggle terminal
vim.keymap.set({ 'n', 't', 'i' }, '<leader>tt', '<cmd>ToggleTerm direction=horizontal<CR>', { desc = 'Toggle terminal' })
vim.keymap.set({ 'n', 't', 'i' }, '<leader>tT', '<cmd>ToggleTerm direction=float<CR>', { desc = 'Toggle float terminal' })

-- Toggle spell checking
vim.keymap.set('n', '<leader>ts', function()
  vim.opt.spell = not vim.opt.spell:get()
  if vim.opt.spell:get() then
    print 'Spell checking: on'
  else
    print 'Spell checking: off'
  end
end, { desc = 'Toggle spell checking' })

-- Keymaps for inner autocomplete
vim.api.nvim_set_keymap('c', '<C-j>', [[ wildmenumode() ? '<C-n>' : '<C-j>' ]], { expr = true, noremap = true })
vim.api.nvim_set_keymap('c', '<C-k>', [[ wildmenumode() ? '<C-p>' : '<C-j>' ]], { expr = true, noremap = true })
