require("mason").setup {}

-- Setup language servers
require("lspconfig").tsserver.setup {}
require("lspconfig").yamlls.setup{}
require("lspconfig").bashls.setup{}
require("lspconfig").terraformls.setup{}

require("lspconfig").lua_ls.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim", "use" }
            }
        }
    }
}

local cmp = require("cmp")
cmp.setup({
    mapping = cmp.mapping.preset.insert({
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
      ['<C-Space>'] = cmp.mapping.complete(),
	    ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
                return
            end
            fallback()
        end),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
                return
            end
            fallback()
        end)
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "path" }
    })
})
