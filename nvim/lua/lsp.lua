-- Imports
local cmp = require("cmp")
local lsp_config = require("lspconfig")
local null_ls = require("null-ls")
local mason_lsp = require("mason-lspconfig")

require("mason").setup {}
mason_lsp.setup {
  ensure_installed = { "tsserver", "yamlls", "bashls", "terraformls", "lua_ls" }
}

-- Format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local function formatIfSupported(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr })
      end,
    })
  end
end

-- Setup language servers
mason_lsp.setup_handlers {
  function(server_name)
    require("lspconfig")[server_name].setup {
      on_attach = formatIfSupported
    }
  end,
  ["lua_ls"] = function()
    lsp_config.lua_ls.setup {
      on_attach = formatIfSupported,
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT"
          },
          diagnostics = {
            globals = { "vim", "use" }
          }
        }
      }
    }
  end
}

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
  }),
})

null_ls.setup({
  null_ls.builtins.completion.spell,
  null_ls.builtins.formatting.prettier,
  on_attach = formatIfSupported
})
