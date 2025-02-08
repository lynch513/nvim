return {
  'akinsho/toggleterm.nvim',
  event = 'VeryLazy',
  -- keys = {
  --   { '<leader>tt', '<cmd>ToggleTerm<cr>', desc = 'Toggle terminal' },
  -- },
  opts = {
    close_on_exit = true,
    autochdir = true,
    shell = vim.o.shell,
    size = 20,
    start_in_insert = true,
    -- direction = 'float', -- float, horizontal
    hide_numbers = true,
  },
}
