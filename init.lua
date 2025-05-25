require("config.lazy")

vim.o.number = true           -- Show line numbers
vim.o.relativenumber = true   -- Relative line numbers
vim.o.expandtab = true        -- Convert tabs to spaces
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.mouse = "a"             -- Enable mouse

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

require('lualine').setup()

require('telescope').setup()
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<CR>', { noremap = true, silent = true })


vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  pattern = "*",
  command = "wall",
})


function OpenFileSmart(path)
    local tab_count = vim.fn.tabpagenr('$')
    if tab_count > 1 or #vim.api.nvim_list_bufs() > 1 then
        vim.cmd('tabnew ' .. vim.fn.fnameescape(path))
    else
        vim.cmd('edit ' .. vim.fn.fnameescape(path))
    end
end

-- Usage: :lua OpenFileSmart("your_file.txt")


vim.api.nvim_create_user_command('OpenSmart', function(opts)
  OpenFileSmart(opts.args)
end, { nargs = 1, complete = 'file' })

--  Usage: :OpenSmart your_file.txt


