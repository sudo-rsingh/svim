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


vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  pattern = "*",
  command = "wall",
})

-- vim.diagnostic.config({  
--   virtual_text = {
--     prefix = '●',  -- Can use '■', '▎', 'x'
--     spacing = 2,
--     source = "always", -- Show source name too (optional)
--   },
-- })
