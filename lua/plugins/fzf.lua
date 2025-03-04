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
    vim.keymap.set('n', '<leader>fh', '<cmd>FzfLua help_tags<cr>', { desc = 'Find help' })
    vim.keymap.set('n', '<leader>fd', '<cmd>FzfLua diagnostics_document<cr>', { desc = 'Find document diagnostics' })
    vim.keymap.set('n', '<leader>fD', '<cmd>FzfLua diagnostics_workspace<cr>', { desc = 'Find workspace diagnostics' })
    vim.keymap.set('n', '<leader>f.', '<cmd>FzfLua oldfiles<cr>', { desc = 'Find recent files' })
    -- Search
    vim.keymap.set('n', '<leader>sg', require('fzf-lua').live_grep, { desc = 'Search word in files' })
    vim.keymap.set('n', '<leader>ss', '<cmd>FzfLua lgrep_curbuf<cr>', { desc = 'Fuzzily search in current buffer' })
    -- Buffers
    vim.keymap.set('n', '<leader>bb', '<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>', { desc = 'Buffers' })
  end,
}
