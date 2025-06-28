

vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>bn', ':tabnew<CR>', { noremap = true, silent = true })
-- Move to tab left/right
vim.keymap.set('n', '<leader>b<Right>', ':tabnext<CR>', { desc = 'Move tab left' })
vim.keymap.set('n', '<leader>b<Left>', ':tabprevious<CR>', { desc = 'Move tab right' })

vim.keymap.set('n', '<leader>q', function()
  if #vim.api.nvim_list_tabpages() > 1 then
    vim.cmd('tabclose')
  else
    vim.cmd('qa')
  end
end, { desc = "Close tab or exit if last" })


vim.keymap.set('n', '<leader>b', ':silent !xdg-open <cWORD><CR>', { noremap = true, silent = true })

