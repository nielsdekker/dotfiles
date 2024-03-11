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
                  unpack(vim.api.nvim_get_runtime_file('', true)),
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
          on_attach = function(client)
            client.server_capabilities.document_formatting = false
          end
        }
      end,
    }
  end
}
