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
        "bashls",
        "eslint",
        "lemminx",
        "lua_ls",
        "terraformls",
        "yamlls",
        "tsserver",
      }
    }

    mason_lsp.setup_handlers {
      -- Default config for all langauge servers
      function(server_name)
        require("lspconfig")[server_name].setup {
          on_attach = formatIfSupported
        }
      end,

      -- Custom settings for specific LSP's
      ["kotlin_language_server"] = function()
        lsp_config.kotlin_language_server.setup {
          root_dir = lsp_config.util.find_git_ancestor,
          init_options = {
            storagePath = lsp_config.util.find_git_ancestor,
          }
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
      end,

      ["yamlls"] = function()
        lsp_config.yamlls.setup {
          on_attach = formatIfSupported,
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
