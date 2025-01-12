return {
  'lewis6991/gitsigns.nvim',
  config = function()
    local gitsigns = require 'gitsigns'
    gitsigns.setup()

    vim.keymap.set('n', '<leader>gp', gitsigns.preview_hunk, { desc = 'Git preview' })
    vim.keymap.set('n', '<leader>gB', gitsigns.blame_line, { desc = 'Git blame line' })

    -- Toggle git blame line
    local git_blame_line_flag = false

    vim.keymap.set('n', '<leader>tb', function()
      git_blame_line_flag = not git_blame_line_flag

      if git_blame_line_flag then
        gitsigns.toggle_current_line_blame(true)
      else
        gitsigns.toggle_current_line_blame(false)
      end
    end, { desc = 'Toggle git blame line' })
  end,
}
