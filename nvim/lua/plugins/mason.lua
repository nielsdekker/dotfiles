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
  end
}
