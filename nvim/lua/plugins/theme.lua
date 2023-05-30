return {
  "catppuccin/nvim",
  config = function()
    require("catppuccin").setup({
      flavour = "latte",
      transparent_background = true
    })
    vim.cmd("colorscheme catppuccin")
  end
}
