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
    -- { 'nvim-telescope/telescope-live-grep-args.nvim' },
    { 'nvim-telescope/telescope-project.nvim' },
  },
  config = function()
    local actions = require 'telescope.actions'
    local builtin = require 'telescope.builtin'
    local extensions = require('telescope').extensions

    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ['<C-k>'] = actions.move_selection_previous,
            ['<C-j>'] = actions.move_selection_next,
            ['<C-l>'] = actions.select_default,
            ['<C-enter>'] = actions.to_fuzzy_refine,
          },
          n = {
            ['q'] = actions.close,
          },
        },
        layout_config = {
          horizontal = {
            height = 0.95,
            width = 0.95,
          },
        },
      },
      pickers = {
        find_files = {
          file_ignore_patterns = { 'node_modules', '%.git[\\/]', '%.venv[\\/]', '%.nuget[\\/]', '%.dotnet[\\/]', '%.npm[\\/]', '%.gradle[\\/]', '%.m2[\\/]' },
          hidden = true,
          no_ignore = true,
          no_ignore_parent = true,
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
          file_ignore_patterns = { 'node_modules', '%.git[\\/]', '%.venv[/\\]', '%.nuget[\\/]', '%.dotnet[\\/]', '%.npm[\\/]', '%.gradle[\\/]', '%.m2[\\/]' },
          additional_args = function(_)
            return { '--hidden', '--no-ignore' }
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
      extensions = {
        live_grep_args = {
          file_ignore_patterns = { 'node_modules', '%.git[\\/]', '%.venv[/\\]', '%.nuget[\\/]', '%.dotnet[\\/]', '%.npm[\\/]', '%.gradle[\\/]', '%.m2[\\/]' },
          additional_args = function(_)
            return { '--hidden', '--no-ignore' }
          end,
        },
      },
    }

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
    pcall(require('telescope').load_extension, 'project')

    -- Find & Files
    vim.keymap.set('n', '<leader>sw', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Search word in open files',
      }
    end, { desc = 'Search word in open files' })
    vim.keymap.set('n', '<leader>sp', function()
      extensions.project.project {
        display_type = 'full',
      }
    end, { desc = 'Search projects' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = 'Search keymaps' })
  end,
}
