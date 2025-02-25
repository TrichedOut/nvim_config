return {
  "stevearc/vim-arduino",
  ft = "arduino",
  config = function()
    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>ra", "<cmd>ArduinoAttach<CR>",      { desc = "Attach to arduino" } )
    keymap.set("n", "<leader>rv", "<cmd>ArduinoVerify<CR>",      { desc = "Verify arduino sketch" } )
    keymap.set("n", "<leader>ru", "<cmd>ArduinoUpload<CR>",      { desc = "Upload to arduino" } )
    keymap.set("n", "<leader>rs", "<cmd>ArduinoSerial<CR>",      { desc = "Connect over serial port" } )
    keymap.set("n", "<leader>rb", "<cmd>ArduinoChooseBoard<CR>", { desc = "Select board" } )
  end
}
