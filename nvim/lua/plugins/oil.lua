return {
  "stevearc/oil.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    local oil = require("oil")
    oil.setup({
      colums = {
        "icon"
      }
    })

    vim.keymap.set("n", "-", function() oil.open() end)
  end
}
