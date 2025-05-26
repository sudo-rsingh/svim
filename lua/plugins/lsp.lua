-- lazy.nvim plugins for LSP
return {
    'neovim/nvim-lspconfig',   -- LSP configurations
    dependencies = {
        'hrsh7th/nvim-cmp',
    },
    config = function()
        local on_attach = function(_, bufnr)
            local opts = { buffer = bufnr }
        
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        end

        require('lspconfig').pyright.setup { 
            on_attach = on_attach,
        }    
    end

}

