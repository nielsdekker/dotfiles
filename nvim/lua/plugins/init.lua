local MiniDeps = require("mini.deps")
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- Setup mini
require("plugins.mini")

-- Tools
later(function()
  add("tpope/vim-fugitive")
  add("stevearc/conform.nvim")
  add({
    source = "neovim/nvim-lspconfig",
    depends = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    }
  })
  add({
    source = "mfussenegger/nvim-dap",
  })
  add({
    source = "stevearc/overseer.nvim"
  })

  require("plugins.conform_settings")
  require("plugins.lsp")
  require("plugins.dap")
  -- require("plugins.mini_extra")
end)

now(function()
  add({
    source = "nvim-treesitter/nvim-treesitter",
    hooks = {
      post_checkout = function()
        vim.cmd("TSUpdate")
      end
    },
  })

  require("plugins.treesitter")
end)

-- Theming
now(function()
  add({ source = "folke/tokyonight.nvim", name = "tokyonight" })
  add({ source = "catppuccin/nvim", name = "catppuccin" })

  require("tokyonight").setup({
    style = "storm",
    transparent = true,
  })

  vim.cmd("colorscheme tokyonight")
end)
