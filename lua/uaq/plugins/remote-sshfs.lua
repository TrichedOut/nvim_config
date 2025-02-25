return {
  "nosduco/remote-sshfs.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  opts = {},
  config = function()
    require('remote-sshfs').setup{
      connections = {
        ssh_configs = { -- which ssh configs to parse for hosts list
          vim.fn.expand "$HOME" .. "/.ssh/config",
          "/etc/ssh/ssh_config",
          -- "/path/to/custom/ssh_config"
        },
        -- NOTE: Can define ssh_configs similarly to include all configs in a folder
        -- ssh_configs = vim.split(vim.fn.globpath(vim.fn.expand "$HOME" .. "/.ssh/configs", "*"), "\n")
        sshfs_args = { -- arguments to pass to the sshfs command
          "-o reconnect",
          "-o ConnectTimeout=5",
        },
      },
      mounts = {
        unmount_on_exit = true, -- run sshfs as foreground, will unmount on vim exit
      },
      handlers = {
        on_connect = {
          change_dir = true, -- when connected change vim working directory to mount point
        },
        on_disconnect = {
          clean_mount_folders = true, -- remove mount point folder on disconnect/unmount
        },
        on_edit = {}, -- not yet implemented
      },
      ui = {
        select_prompts = false, -- not yet implemented
        confirm = {
          connect = true, -- prompt y/n when host is selected to connect to
          change_dir = false, -- prompt y/n to change working directory on connection (only applicable if handlers.on_connect.change_dir is enabled)
        },
      },
      log = {
        enable = false, -- enable logging
        truncate = false, -- truncate logs
        types = { -- enabled log types
          all = false,
          util = false,
          handler = false,
          sshfs = false,
        },
      },
    }
    
    local keymap = vim.keymap
    local api = require('remote-sshfs.api')

    keymap.set("n", "<leader>rc", function()
      os.execute("umount /Users/uaq/.sshfs/cs361/")
      api.connect()
    end,   { desc = "Connect to Remote"} )
    keymap.set("n", "<leader>rd", "<cmd>RemoteSSHFSDisconnect<CR>",         { desc = "Disconnect from Remote"} )
    keymap.set("n", "<leader>re", "<cmd>RemoteSSHFSEdit<CR>",         { desc = "Edit configs for remotes"} )
  end
}
