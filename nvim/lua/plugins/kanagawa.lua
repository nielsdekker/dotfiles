return {
  "rebelot/kanagawa.nvim",
  config = function()
    require("kanagawa").setup({
      commentStyle = { italic = true },
      transparent = true,
    })

    vim.cmd("colorscheme kanagawa")
  end
}
