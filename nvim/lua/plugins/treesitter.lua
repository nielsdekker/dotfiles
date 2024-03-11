return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require "nvim-treesitter.configs".setup {
      sync_install = false,
      auto_install = true,

      highlight = {
        enable = true
      },
      autotag = {
        enable = true
      },
      indent = {
        enable = true
      }
    }
  end
}
