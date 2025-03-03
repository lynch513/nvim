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
        width = 0.8,
        height = 0.8,
        row = 0.5,
        col = 0.5,
        preview = {
          scrollchars = { '┃', '' },
        },
      },
    }
  end,
  config = function(_, opts)
    require('fzf-lua').setup(opts)
  end,
}
