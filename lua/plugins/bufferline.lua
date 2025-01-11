return {
  'akinsho/bufferline.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('bufferline').setup {
      options = {
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        mode = 'buffers',
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'File Explorer',
            separator = true,
            padding = 1,
          },
        },
        diagnostics = 'nvim_lsp',
        show_tab_indicators = false,
        indicator = {
          -- icon = '  ', -- this should be omitted if indicator style is not 'icon'
          style = 'none',
        },
        -- separator_style = "slope"
      },
    }
  end,
}
