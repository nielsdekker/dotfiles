return {
  "echasnovski/mini.starter",
  dependencies = {
    "echasnovski/mini.extra",
  },
  config = function()
    local starter = require("mini.starter");

    starter.setup({})
  end
}
