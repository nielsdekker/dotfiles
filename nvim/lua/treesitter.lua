require "nvim-treesitter.configs".setup {
  ensure_installed = {
    "javascript",
    "typescript",
    "lua",
    "yaml",
    "terraform"
  },
  auto_install = true,

  highlight = {
    enable = true
  }
}

