return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',

      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = 'make',

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    -- Useful for getting pretty icons, but requires a Nerd Font.
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    local actions = require 'telescope.actions'
    local builtin = require 'telescope.builtin'

    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ['<C-k>'] = actions.move_selection_previous,
            ['<C-j>'] = actions.move_selection_next,
            ['<C-l>'] = actions.select_default,
            ['<c-enter>'] = 'to_fuzzy_refine',
          },
          n = {
            ['q'] = actions.close,
          },
        },
      },
      pickers = {
        find_files = {
          file_ignore_patterns = { 'node_modules', '%.git/', '%.venv/' },
          hidden = true,
        },
        buffers = {
          initial_mode = 'insert',
          sort_lastused = true,
          -- sort_mru = true,
          mappings = {
            n = {
              ['d'] = actions.delete_buffer,
              ['l'] = actions.select_default,
            },
          },
        },
        live_grep = {
          file_ignore_patterns = { 'node_modules', '%.git/', '%.venv/' },
          additional_args = function(_)
            return { '--hidden' }
          end,
        },
        path_display = {
          filename_first = {
            reverse_directories = true,
          },
        },
        git_files = {
          previewer = false,
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      },
    }

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    -- vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    -- vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    -- vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
    -- vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    -- vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    -- vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    -- vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    -- vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    -- vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

    -- Find & Files
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
    vim.keymap.set('n', '<leader>fm', builtin.marks, { desc = 'Find marks' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find help' })
    vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Find diagnostics' })
    vim.keymap.set('n', '<leader>fn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = 'Find Neovim files' })
    -- vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = 'Find resume' })
    vim.keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = 'Find recent files ("." for repeat)' })
    -- Buffers
    vim.keymap.set('n', '<leader>bb', builtin.buffers, { desc = 'Find existing buffers' })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = 'Search existing buffers' })
    -- Git
    vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search git files' })
    vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'Search git commits' })
    vim.keymap.set('n', '<leader>gC', builtin.git_bcommits, { desc = 'Search git commits for current file' })
    vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = 'Search git branches' })
    vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = 'Search git status (diff view)' })
    -- Search
    -- vim.keymap.set('n', '<leader>sg', builtin.grep_string, { desc = 'Search word in files' })
    vim.keymap.set('n', '<leader>sg', function()
      builtin.live_grep {
        prompt_title = 'Search word in all files',
      }
    end, { desc = 'Search word in files' })
    vim.keymap.set('n', '<leader>ss', function()
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = 'Fuzzily search in current buffer' })
    vim.keymap.set('n', '<leader>sw', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Search word in open files',
      }
    end, { desc = 'Search word in open files' })
  end,
}
