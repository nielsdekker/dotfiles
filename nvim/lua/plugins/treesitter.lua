local configs = require("nvim-treesitter.configs")
configs.setup({
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
})
