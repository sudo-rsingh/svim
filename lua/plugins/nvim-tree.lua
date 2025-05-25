
vim.keymap.set('n', '<leader>ee', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        require("nvim-tree").setup({ 
            view = {
                float = {
                    enable = true,
                    open_win_config = function()
                        local screen_w = vim.o.columns
                        local screen_h = vim.o.lines
                        local col = math.ceil(0.25 * screen_w)
                        local row = math.ceil(0.25 * screen_h - 1)

                        return {              
                            relative = "editor",
                            border = "rounded",
                            width = math.ceil(0.5 * screen_w),
                            height = math.ceil(0.5 * screen_h),
                            row = row,
                            col = col,
                        }
                    end,
                }
            }
        })
    end
}
