--vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

vim.keymap.set("n", "<leader>gs", function()
  vim.cmd("vertical Git")
end)
