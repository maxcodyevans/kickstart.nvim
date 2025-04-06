-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'olimorris/codecompanion.nvim',
    vim.api.nvim_set_keymap('n', '<C-]>', ':CodeCompanionChat<CR>', { noremap = true, silent = true }),
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
      { 'nvim-lua/plenary.nvim' },
      -- Test with blink.cmp
      {
        'saghen/blink.cmp',
        lazy = false,
        version = '*',
        opts = {
          keymap = {
            preset = 'enter',
            ['<S-Tab>'] = { 'select_prev', 'fallback' },
            ['<Tab>'] = { 'select_next', 'fallback' },
          },
          cmdline = { sources = { 'cmdline' } },
          sources = {
            default = { 'lsp', 'path', 'buffer', 'codecompanion' },
          },
        },
      },
      -- Test with nvim-cmp
      -- { "hrsh7th/nvim-cmp" },
    },
    opts = {
      --Refer to: https://github.com/olimorris/codecompanion.nvim/blob/main/lua/codecompanion/config.lua
      strategies = {
        --NOTE: Change the adapter as required
        chat = { adapter = 'openai' },
        inline = { adapter = 'openai' },
      },
      opts = {
        log_level = 'DEBUG',
      },
    },
  },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        -- Default configuration
        size = 10,
        direction = 'horizontal', -- 'float', 'horizontal', 'vertical', 'tab'
        shade_terminals = true,
        float_opts = {
          border = 'curved', -- 'single', 'double', 'shadow', 'curved'
          width = 120,
          height = 30,
        },
      }

      -- Set multiple keybindings for toggling the terminal
      vim.api.nvim_set_keymap('n', '<C-\\>', ':ToggleTerm<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '\\\\', ':ToggleTerm<CR>', { noremap = true, silent = true })
    end,
  },
}
