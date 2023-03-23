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
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-path"

    -- Debugging
    use { "mfussenegger/nvim-dap" }
    use { "rcarriga/nvim-dap-ui" }
    use { "nvim-telescope/telescope-dap.nvim" }

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
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- Developer tools
    use "tpope/vim-fugitive"
    use "dense-analysis/ale"
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

-- Set ups autocomplete and stuff for all the plugins
require("neodev").setup({
  library = {
    plugins = { "nvim-dap-ui", "telescope.nvim", "nvim-dap" },
    types = true
  }
})
