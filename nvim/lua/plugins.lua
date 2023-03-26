require("packer").startup(function()
  -- packer itself
  use "wbthomason/packer.nvim"

  -- Helps with lua configs
  use "folke/neodev.nvim"

  -- Language server/syntax stuff
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate"
  }
  use "neovim/nvim-lspconfig"
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-vsnip"
  use "hrsh7th/vim-vsnip"
  use "jose-elias-alvarez/null-ls.nvim"

  -- Copilot
  use "github/copilot.vim"

  -- Debugging
  use {
    "mfussenegger/nvim-dap",
    requires = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-telescope/telescope-dap.nvim"
    }
  }

  -- Files and navigation
  use "tpope/vim-vinegar"
  use "easymotion/vim-easymotion"
  use {
    "nvim-telescope/telescope.nvim", tag = "0.1.x",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").load_extension("dap")
    end
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Developer tools
  use "tpope/vim-fugitive"
  use {
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

  -- Theming
  use "EdenEast/nightfox.nvim"
end)
