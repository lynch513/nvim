require 'keymaps' -- Load general keymaps
require 'options' -- Load general options

-- Set to true if a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Install package manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Setup plugins
require('lazy').setup({
  require 'plugins.langmapper',
  require 'plugins.which-key',
  require 'plugins.telescope',
  require 'plugins.autopairs',
  require 'plugins.indent-line',
  require 'plugins.todo-comments',
  require 'plugins.nvim-surround',
  -- Appearance
  require 'plugins.neo-tree',
  require 'plugins.themes',
  require 'plugins.lualine',
  require 'plugins.bufferline',
  require 'plugins.noice',
  -- Autocomplete
  require 'plugins.nvim-cmp',
  -- LSP configuration
  require 'plugins.lazydev',
  require 'plugins.luvit',
  require 'plugins.nvim-lspconfig',
  require 'plugins.nvim-treesitter',
  -- Autoformat
  require 'plugins.conform',
  -- Linting
  require 'plugins.lint',
  -- Start page
  require 'plugins.alpha',
  -- Git
  require 'plugins.gitsigns',
  require 'plugins.lazy-git',
  -- require 'plugins.neogit',
  -- Other
  require 'plugins.render-markdown',
  require 'plugins.markdown-preview',
  require 'plugins.vim-tmux-navigator',
  require 'plugins.toggleterm', -- terminal
  require 'plugins.nvim-ufo', -- folding
  require 'plugins.nvim-highlight-colors',
  require 'plugins.obsidian',
  require 'plugins.gx',
  -- require 'plugins.resession',
}, {
  ui = {
    -- If you have a Nerd Font, set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

require('langmapper').automapping { global = true, buffer = true }
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
