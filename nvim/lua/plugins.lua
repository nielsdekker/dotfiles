return require("packer").startup(function()
    -- packer itself
    use "wbthomason/packer.nvim"

    -- Files and navigation
    use "tpope/vim-vinegar"
    use "junegunn/fzf.vim"
    use "easymotion/vim-easymotion"

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

    -- Language server stuff
    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-vsnip"
    use "hrsh7th/vim-vsnip"

    -- Theming
    use "folke/tokyonight.nvim"
    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            vim.opt.termguicolors = true
            vim.cmd [[highlight IndentBlanklineIndent1 guibg=#24283b gui=nocombine]]
            vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1b26 gui=nocombine]]

            require("indent_blankline").setup {
                char = "",
                char_highlight_list = {
                    "IndentBlanklineIndent1",
                    "IndentBlanklineIndent2",
                },
                space_char_highlight_list = {
                    "IndentBlanklineIndent1",
                    "IndentBlanklineIndent2",
                },
                show_trailing_blankline_indent = false,
            }
        end
    }
end)
