return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "latte",
      transparent_background = true,
    })

    vim.cmd("colorscheme catppuccin")
  end
}
--[[
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
return {
  "folke/tokyonight.nvim",
  config = function()
    vim.cmd("colorscheme tokyonight-day")
  end
}
]]
