return {
  "folke/tokyonight.nvim",
  config = function()
    vim.cmd("colorscheme tokyonight-day")
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
]]
