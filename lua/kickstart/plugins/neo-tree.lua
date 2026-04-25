-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    close_if_last_window = true,
    filesystem = {
      filtered_items = { visible = true },
      window = {
        auto_expand_width = true,
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
  },
  init = function()
    vim.api.nvim_create_augroup('neotree', {})
    vim.api.nvim_create_autocmd('UiEnter', {
      desc = 'Open Neotree automatically',
      group = 'neotree',
      callback = function()
        if vim.fn.argc() == 0 then
          vim.cmd 'Neotree toggle'
        end
      end,
    })
  end,
}
