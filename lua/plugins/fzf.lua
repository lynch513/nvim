return {
  'ibhagwan/fzf-lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  opts = function(_, opts)
    return {
      fzf_colors = true,
      defaults = {
        formatter = 'path.dirname_first',
      },
      winopts = {
        width = 0.9,
        height = 0.9,
        row = 0.5,
        col = 0.5,
      },
    }
  end,
  config = function(_, opts)
    require('fzf-lua').setup(opts)
    -- Find & Files
    vim.keymap.set('n', '<leader>ff', require('fzf-lua').files, { desc = 'Find files' })
    vim.keymap.set('n', '<leader>fm', '<cmd>FzfLua marks<cr>', { desc = 'Find marks' })
    vim.keymap.set('n', '<leader>f.', '<cmd>FzfLua oldfiles<cr>', { desc = 'Find recent files' })
    -- Search
    vim.keymap.set('n', '<leader>sg', require('fzf-lua').live_grep, { desc = 'Search word in files' })
    vim.keymap.set('n', '<leader>ss', '<cmd>FzfLua lgrep_curbuf<cr>', { desc = 'Fuzzily search in current buffer' })
    vim.keymap.set('n', '<leader>sm', '<cmd>Noice fzf<CR>', { desc = 'Search noice messages' })
    vim.keymap.set('n', '<leader>sh', '<cmd>FzfLua help_tags<cr>', { desc = 'Search help' })
    vim.keymap.set('n', '<leader>sd', '<cmd>FzfLua diagnostics_document<cr>', { desc = 'Search document diagnostics' })
    vim.keymap.set('n', '<leader>sD', '<cmd>FzfLua diagnostics_workspace<cr>', { desc = 'Search workspace diagnostics' })
    -- Buffers
    vim.keymap.set('n', '<leader>bb', '<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>', { desc = 'Buffers' })
    vim.keymap.set('n', '<leader><leader>', '<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>', { desc = 'Buffers' })
    -- Git
    vim.keymap.set('n', '<leader>gf', '<cmd>FzfLua git_files<cr>', { desc = 'Search git files' })
    vim.keymap.set('n', '<leader>gc', '<cmd>FzfLua git_commits<cr>', { desc = 'Search git commits' })
    vim.keymap.set('n', '<leader>gC', '<cmd>FzfLua git_bcommits<cr>', { desc = 'Search git commits for current file' })
    vim.keymap.set('n', '<leader>gb', '<cmd>FzfLua git_branches<cr>', { desc = 'Search git branches' })
    vim.keymap.set('n', '<leader>gB', '<cmd>FzfLua git_blame<cr>', { desc = 'Blame current buffer' })
    vim.keymap.set('n', '<leader>gs', '<cmd>FzfLua git_status<cr>', { desc = 'Search git status (diff view)' })
  end,
}
