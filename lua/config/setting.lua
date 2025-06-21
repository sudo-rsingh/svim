-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.o.number = true           -- Show line numbers
vim.o.relativenumber = true   -- Relative line numbers
vim.o.expandtab = true        -- Convert tabs to spaces
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.mouse = "a"             -- Enable mouse

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- Normal mode left/right
vim.keymap.set('n', '<Left>', function()
  if vim.fn.col('.') == 1 then
    return 'k$'
  else
    return '<Left>'
  end
end, { expr = true, noremap = true })


vim.keymap.set('n', '<Left>', function()
  if vim.fn.col('.') == 1 then
    return 'k$'
  else
    return '<Left>'
  end
end, { expr = true, noremap = true })

vim.keymap.set('n', '<Right>', function()
  local col = vim.fn.col('.')
  local lastcol = vim.fn.col('$')
  local line = vim.fn.getline('.')
  if col >= lastcol - 1 or line == '' then
    return 'j0'
  else
    return '<Right>'
  end
end, { expr = true, noremap = true })

-- vim.opt.cursorline = true  -- Highlights current line background
-- vim.api.nvim_set_hl(0, 'LineNr', { fg = '#FFFFFF' })  -- Orange numbers
-- vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#000000', bold = true })

-- vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
--   pattern = "*",
--   command = "wall",
-- })




vim.api.nvim_create_autocmd("FileType", {
  pattern = "NvimTree",
  callback = function()
    vim.keymap.set("n", "<Esc>", ":NvimTreeClose<CR>", { buffer = true, silent = true })
  end,
})


vim.diagnostic.config({  
  virtual_text = {
    severity = vim.diagnostic.severity.ERROR,
    prefix = '●',  -- Can use '■', '▎', 'x'
    spacing = 2,
    source = "always", -- Show source name too (optional)
  },
})

-- Create augroup to prevent duplicate autocommands
local cwd_sync = vim.api.nvim_create_augroup("CwdSync", { clear = true })

vim.api.nvim_create_autocmd("VimLeave", {
  pattern = "*",
  group = cwd_sync,
  callback = function()
    vim.fn.writefile({vim.fn.getcwd()}, '/tmp/nvim_cwd', 'b')
  end
})

