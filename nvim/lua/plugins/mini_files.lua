return {
  "echasnovski/mini.files",
  dependencies = {
    "echasnovski/mini.nvim",
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    require("mini.files").setup({
      windows = {
        preview = true,
        width_preview = 50,
      }
    })
  end
}
