local MiniDeps = require("mini.deps")
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- Setup mini
require("plugins/mini").setup()

-- Tools
later(function()
  add("tpope/vim-fugitive")
  add("folke/trouble.nvim")
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
    depends = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio"
    },
  })

  require("plugins/conform").setup()
  require("plugins/lsp").setup()
  require("plugins/dap").setup()
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
  require("plugins/treesitter").setup()
end)

-- Theming
now(function()
  add({ source = "catppuccin/nvim", name = "catppuccin" })
  add({ source = "rose-pine/neovim", name = "rose-pine" })
  add({ source = "folke/tokyonight.nvim", name = "tokyonight" })
  add("savq/melange-nvim")
  add("kepano/flexoki-neovim")

  vim.cmd("colorscheme melange")
end)
