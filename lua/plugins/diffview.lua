return {
  'sindrets/diffview.nvim',
  config = function()
    local wk = require('which-key')
    wk.add({
      { '<leader>d',  group = '[D]iffview' },
      { '<leader>do', '<cmd>DiffviewOpen<CR>',  desc = "Open Diffview" },
      { '<leader>dc', '<cmd>DiffviewClose<CR>', desc = "Close Diffview" },
      {
        '<leader>dh',
        function()
          local path = vim.fn.expand('%')
          vim.cmd { cmd = "DiffviewFileHistory", args = { path } }
        end,
        desc = "Current buffer file history "
      },
      { '<leader>df', '<cmd>DiffviewFocusFiles<CR>', desc = 'Focus files' },
    })
    vim.opt.fillchars:append { diff = "/" }
  end
}
