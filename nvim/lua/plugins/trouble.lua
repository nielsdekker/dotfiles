return {
  "folke/trouble.nvim",
  config = function()
    require("trouble").setup {
      icons = false,
      fold_open = "v",
      fold_closed = ">",
      signs = {
        error = "[E]",
        warning = "[W]",
        hint = "[H]",
        information = "[I]"
      },
      use_diagnostic_signs = false
    }
  end
}
