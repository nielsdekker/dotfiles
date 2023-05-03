return {
  "catppuccin/nvim",
  config = function()
    require("catppuccin").setup({
      flavour = "frappe",
      dim_inactive = {
        enabled = true
      }
    })
    vim.cmd("colorscheme catppuccin")
  end
}
