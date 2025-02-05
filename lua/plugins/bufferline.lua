return {
  'akinsho/bufferline.nvim',
  event = 'VeryLazy',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    { '<leader>bp', '<Cmd>BufferLineTogglePin<CR>', desc = 'Buffer toggle pin' },
    { '<leader>bC', '<Cmd>BufferLineGroupClose ungrouped<CR>', desc = 'Close unpinned buffers' },
    { ']t', '<Cmd>BufferLineCycleNext<CR>', desc = 'Go to next buffer' },
    { '[t', '<Cmd>BufferLineCyclePrev<CR>', desc = 'Go to previous buffer' },
    { ']T', '<Cmd>BufferLineMoveNext<CR>', desc = 'Move buffer next' },
    { '[T', '<Cmd>BufferLineMovePrev<CR>', desc = 'Move buffer prev' },
  },
  opts = {
    options = {
      max_name_length = 25,
      tab_size = 25,
      diagnostics = 'nvim_lsp',
      diagnostics_indicator = function(count, level, _, _)
        local icon = level:match 'error' and ' ' or ' '
        return ' ' .. icon .. count
      end,
    },
  },
  config = function(_, opts)
    require('bufferline').setup(opts)
  end,
}
