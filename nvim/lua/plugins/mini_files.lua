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
      },
      mappings = {
        close = "<ESC>",
        go_in = "L",
        go_in_plus = "l"
      }
    })
  end
}
