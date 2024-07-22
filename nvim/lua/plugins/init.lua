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
  add({ source = "scottmckendry/cyberdream.nvim", name = "cyberdream" })

  require("cyberdream").setup({
    transparent = true,
    italic_comments = true,

    theme = {
      variant = "light"
    }
  })

  later(function()
    -- Change the highlight group for the mini float because it doesn't really
    -- work with the cyberdream theme
    vim.api.nvim_set_hl(0, "MiniNotifyNormal", { link = "Comment" })
  end)

  vim.cmd("colorscheme cyberdream")
end)
