-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
return {
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup({})
      require("kanagawa").load()
    end
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },

  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    version = "*",
    opts = {
      options = {
        mode = "tabs",
        separator_style = "slant",
      },
    },
  },

  {
    "snacks.nvim",
    keys = {
      { "<leader>e", function() Snacks.explorer({
        hidden = true,
        ignored = true,
        exclude = {
          "**.gd.uid",
          "**.cache*",
          "**.git*",
        },
        include = {
        }
      }) end, desc="Explorer"},

      { "<leader>E", false },
    },
    opts = {
      scroll = { enabled = false },
      dashboard = { enabled = false },
      words = { enabled = false },
      notifier = { enabled = false },
      picker = { }
    },
  },

  {
    "folke/flash.nvim",
    enabled = false,
  }
}
