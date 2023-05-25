return {
  "catppuccin/nvim",
  config = function()
    require("catppuccin").setup({
      flavour = "latte",
      dim_inactive = {
        enabled = true
      }
    })
    vim.cmd("colorscheme catppuccin")
  end
}
