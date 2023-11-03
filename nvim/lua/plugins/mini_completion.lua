return {
  "echasnovski/mini.completion",
  dependencies = {
    "echasnovski/mini.nvim",
  },
  config = function()
    require("mini.completion").setup({})
  end
}
