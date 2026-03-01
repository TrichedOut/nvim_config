return {
  {
    "snacks.nvim",
    keys = {
      { "<leader>e", function() Snacks.explorer({
        exclude = {
          "**.gd.uid"
        }
      }) end, desc="Explorer"},

      { "<leader>E", false },
    },
    opts = {
      scroll = { enabled = false },
      dashboard = { enabled = false },
      words = { enabled = false },
      notifier = { enabled = false },
      explorer = {
      },
      picker = {
        sources = {
          files = {
            hidden = true,
            ignored = true,
            exclude = {
              "**/.git/*",
              "**.gd.uid"
            }
          }
        },
        explorer = {
          exclude = {
            "**\\.gd\\.uid"
          }
        }
      }
    },
  },
}
