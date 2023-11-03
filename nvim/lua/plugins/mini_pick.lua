return {
  "echasnovski/mini.pick",
  dependencies = {
    "echasnovski/mini.extra",
    "echasnovski/mini.nvim",
  },
  config = function()
    require("mini.pick").setup()
  end
}
