local MiniDeps = require("mini.deps")
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- Setup mini
require("plugins/mini").setup()

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

  require("plugins/conform_settings").setup()
  require("plugins/lsp").setup()
  require("plugins/dap").setup()
  require("plugins/overseer").setup()
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
  add({ source = "folke/tokyonight.nvim", name = "tokyonight" })
  add({ source = "catppuccin/nvim", name = "catppuccin" })

  require("catppuccin").setup({
    flavour = "mocha",
    transparent_background = true,
  })

  vim.cmd("colorscheme catppuccin")

  -- Fix the inlay hint styling
  local current = vim.api.nvim_get_hl(0, { name = "LspInlayHint" })
  vim.api.nvim_set_hl(0, "LspInlayHint", { bg = nil, fg = current.fg, italic = true })
end)
