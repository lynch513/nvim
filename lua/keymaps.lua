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
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
vim.keymap.set('n', ']t', ':bnext<CR>', { desc = 'Go to next buffer' })
vim.keymap.set('n', '[t', ':bprevious<CR>', { desc = 'Go to previous buffer' })
vim.keymap.set('n', '<leader>bk', ':Bdelete!<CR>', { desc = 'Current [B]uffer [K]ill' })
vim.keymap.set('n', '<leader>bc', ':Bdelete!<CR>', { desc = 'Current [B]uffer [C]lose' })
vim.keymap.set('n', '<leader>bn', '<cmd> enew <CR>', { desc = '[B]uffer [N]ew' })

-- Window management
vim.keymap.set('n', '<leader>wv', '<C-w>v', { desc = 'Split [W]indow [V]ertically' })
vim.keymap.set('n', '<leader>ws', '<C-w>s', { desc = 'Split [W]indow [H]orizontally'})
vim.keymap.set('n', '<leader>w=', '<C-w>=', { desc = 'Make split [W]indows [=] equal width & height' })
vim.keymap.set('n', '<leader>wc', ':close<CR>', { desc = '[W]indow [C]lose current split ' }) 

-- Navigate between splits
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', { desc = 'Move focus to the up window' })
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', { desc = 'Move focus to the bottom window' })
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', { desc = 'Move focus to the right window' })

vim.keymap.set('n', '<leader>wk', ':wincmd k<CR>', { desc = 'Move focus to the up window' })
vim.keymap.set('n', '<leader>wj', ':wincmd j<CR>', { desc = 'Move focus to the bottom window' })
vim.keymap.set('n', '<leader>wh', ':wincmd h<CR>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<leader>wl', ':wincmd l<CR>', { desc = 'Move focus to the right window' })

-- Press jk fast to exit insert mode
vim.keymap.set('i', 'jk', '<ESC>', opts)

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

-- Toggle diagnostics
local diagnostics_active = true

vim.keymap.set('n', '<leader>td', function()
  diagnostics_active = not diagnostics_active

  if diagnostics_active then
    vim.diagnostic.enable(0)
  else
    vim.diagnostic.disable(0)
  end
end, 
{ desc = '[T]oggle [D]iagnostics' } )

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
