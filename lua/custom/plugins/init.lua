-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
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
