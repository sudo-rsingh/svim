vim.keymap.set('n', '<leader>mm', ':Mason<CR>', { noremap = true, silent = true })

return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                ui = {
                    border = "rounded",
                    width = 0.5,
                    height = 0.5,
                }
            })
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "neovim/nvim-lspconfig"
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "pyright", "ts_ls" },
                automatic_installation = true,
            })

            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Pyright setup
            lspconfig.pyright.setup({
                capabilities = capabilities,
            })

            lspconfig.ts_ls.setup({
                capabilities = capabilities,
            })

        end
    }
}

