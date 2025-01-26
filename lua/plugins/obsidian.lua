return {
  'epwalsh/obsidian.nvim',
  version = '*',
  lazy = true,
  ft = 'markdown',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  keys = {
    -- Create
    { '<leader>mcn', '<cmd>ObsidianNew<cr>', desc = 'Create new note', mode = 'n' },
    { '<leader>mct', '<cmd>ObsidianNewFromTemplate<cr>', desc = 'Create note from template', mode = 'n' },
    -- Search
    { '<leader>mss', '<cmd>ObsidianQuickSwitch<cr>', desc = 'Quick switch note', mode = 'n' },
    { '<leader>msg', '<cmd>ObsidianSearch<cr>', desc = 'Search note', mode = 'n' },
    { '<leader>mst', '<cmd>ObsidianTags<cr>', desc = 'Search note', mode = 'n' },
    { '<leader>msh', '<cmd>ObsidianTOC<cr>', desc = 'Search headers', mode = 'n' },
    -- Links
    { '<leader>mlo', '<cmd>ObsidianFollowLink<cr>', desc = 'Follow link under cursor', mode = 'n' },
    { '<leader>mlb', '<cmd>ObsidianBacklinks<cr>', desc = 'Show backlinks', mode = 'n' },
    { '<leader>mla', '<cmd>ObsidianLinkNew<cr>', desc = 'Append link and new note', mode = 'n' },
    { '<leader>mlc', '<cmd>ObsidianLink<cr>', desc = 'Create link if note exist', mode = 'n' },
    -- Common
    { '<leader>mt', '<cmd>ObsidianToggleCheckbox<cr>', desc = 'Toggle checkbox', mode = 'n' },
  },
  config = function()
    require('obsidian').setup {
      workspaces = {
        {
          name = 'Vault',
          path = '~/YDisk/Vault',
        },
      },
      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },
      new_notes_location = 'notes_subdir',
      note_id_func = function(title)
        return title
      end,
      note_frontmatter_func = function(note)
        local out = { id = note.id, aliases = note.aliases, tags = note.tags }

        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end

        return out
      end,
      mappings = {},

      templates = {
        subdir = 'Templates',
        date_format = '%Y-%m-%d',
        time_format = '%H:%M',
        tags = '',
        substitutions = {
          yesterday = function()
            return os.date('%Y-%m-%d', os.time() - 86400)
          end,
          tomorrow = function()
            return os.date('%Y-%m-%d', os.time() + 86400)
          end,
        },
      },

      -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
      -- URL it will be ignored but you can customize this behavior here.
      ---@param url string
      follow_url_func = function(url)
        -- Open the URL in the default web browser.
        -- vim.fn.jobstart { 'open', url } -- Mac OS
        vim.fn.jobstart { 'xdg-open', url } -- linux
        -- vim.cmd(':silent exec "!start ' .. url .. '"') -- Windows
        -- vim.ui.open(url) -- need Neovim 0.10.0+
      end,

      ui = {
        enable = false, -- using render-markdown.nvim instead
        checkboxes = {
          [' '] = { char = '󰄱', hl_group = 'ObsidianTodo' },
          ['x'] = { char = '', hl_group = 'ObsidianDone' },
        },
      },
    }
  end,
}
