return require("packer").startup(function()
    -- packer itself
    use "wbthomason/packer.nvim"

    -- Files and navigation
    use "tpope/vim-vinegar"
    use "easymotion/vim-easymotion"
    use {
      "nvim-telescope/telescope.nvim", tag = "0.1.x",
      requires = { {"nvim-lua/plenary.nvim"} }
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

    -- Language server/syntax stuff
    use "sheerun/vim-polyglot"
    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-vsnip"
    use "hrsh7th/vim-vsnip"
    use "hrsh7th/cmp-path"

    -- Theming
    use "folke/tokyonight.nvim"
    use "ayu-theme/ayu-vim"
    use "EdenEast/nightfox.nvim"
end)
