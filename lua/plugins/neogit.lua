return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration
    'nvim-telescope/telescope.nvim', -- optional
  },
  opts = {
    log_date_format = '%Y-%m-%d %H:%M',
  },
  config = function(_, opts)
    local neogit = require 'neogit'
    neogit.setup(opts)
    vim.keymap.set('n', '<leader>gg', neogit.open, { desc = 'Open Neogit' })
  end,
}
