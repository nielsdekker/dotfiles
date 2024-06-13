local lsp_config = require("lspconfig")
local mason = require("mason")
local mason_lsp = require("mason-lspconfig")

mason.setup {}
mason_lsp.setup {
  ensure_installed = {
    "tsserver",
    "gopls",
  }
}

-- Some default configuration about how the LSP should handle diagnostics.
-- In short this disables the inline virtual text and adds a float when
-- hovering over an error instead.
vim.diagnostic.config({
  virtual_text = false
})
vim.o.updatetime = 250
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end
})

mason_lsp.setup_handlers {
  -- Default config for all langauge servers
  function(server_name)
    require("lspconfig")[server_name].setup {}
  end,

  ["lua_ls"] = function()
    lsp_config.lua_ls.setup {
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT"
          },
          workspace = {
            checkThirdParty = false,

            library = {
              unpack(vim.api.nvim_get_runtime_file("", true)),
            },
          }
        }
      }
    }
  end,

  ["yamlls"] = function()
    lsp_config.yamlls.setup {
      settings = {
        yaml = {
          keyOrdering = false,
          schemas = {
            kubernetes = { "**/k8s/**/templates/*.yaml" }
          }
        }
      }
    }
  end,

  ["tsserver"] = function()
    lsp_config.tsserver.setup {
      settings = {
        typescript = {
          inlayHints = {
            includeInlayParameterNameHints = 'all',
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayVariableTypeHintsWhenTypeMatchesName = false,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          }
        },
        javascript = {
          inlayHints = {
            includeInlayParameterNameHints = 'all',
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayVariableTypeHintsWhenTypeMatchesName = false,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          }
        }
      },
      on_attach = function(client)
        client.server_capabilities.document_formatting = false
      end
    }
  end,
}
