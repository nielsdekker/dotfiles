return {
  "rose-pine/neovim",
  config = function()
    require("rose-pine").setup({
      variant = 'dawn',
      disable_background = true
    })
    vim.cmd("colorscheme rose-pine")
  end
}
