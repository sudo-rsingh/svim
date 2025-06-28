return { 
  "catppuccin/nvim", 
  name = "catppuccin", 
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      custom_highlights = function(colors)
        return {
          LineNr = { fg = "#FFFFFF" },          -- White (change to your preferred color)
          CursorLineNr = { fg = "#000000", bold = true }, -- Black and bold
        }
      end,
    })
    vim.cmd("colorscheme catppuccin")
  end
}
