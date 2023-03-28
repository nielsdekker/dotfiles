return {
  "hrsh7th/cmp-nvim-lsp",
  dependencies = {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-vsnip",
    "hrsh7th/vim-vsnip",
  },
  config = function()
    local cmp = require("cmp")

    -- Setup auto completion
    cmp.setup({
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
        end
      },
      mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<Tab>"] = cmp.mapping(function(fallback)
          local copilot_keys = vim.fn["copilot#Accept"]()

          if copilot_keys ~= "" then
            vim.fn.feedkeys(copilot_keys, "n")
            return
          else
            fallback()
          end
        end),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "path" }
      }),
    })
  end
}
