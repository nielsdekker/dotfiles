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
      ensure_installed = {
        "bashls",
        "eslint",
        "lemminx",
        "lua_ls",
        "terraformls",
        "yamlls",
        "tsserver",
      }
    }

    -- Format on save

    mason_lsp.setup_handlers {
      function(server_name)
        require("lspconfig")[server_name].setup {
          on_attach = _util.formatIfSupported
        }
      end,
      ["kotlin_language_server"] = function()
        lsp_config.kotlin_language_server.setup {
          cmd_env = {
            JAVA_OPTS = "-Xmx8g"
          }
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
