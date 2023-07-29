return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  opts = {
    inlay_hints = { enabled = true }
  },
  config = function()
    local _util = require("_util")
    local lsp_config = require("lspconfig")
    local mason = require("mason")
    local mason_lsp = require("mason-lspconfig")

    mason.setup {}
    mason_lsp.setup {
      ensure_installed = { "tsserver", "yamlls", "bashls", "terraformls", "lua_ls" }
    }

    -- Format on save

    mason_lsp.setup_handlers {
      function(server_name)
        require("lspconfig")[server_name].setup {
          on_attach = _util.formatIfSupported
        }
      end,
      ["lua_ls"] = function()
        lsp_config.lua_ls.setup {
          on_attach = _util.formatIfSupported,
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
      end,
      ["yamlls"] = function()
        lsp_config.yamlls.setup {
          on_attach = _util.formatIfSupported,
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
          on_attach = function(client)
            client.server_capabilities.document_formatting = false
          end
        }
      end
    }
  end
}
