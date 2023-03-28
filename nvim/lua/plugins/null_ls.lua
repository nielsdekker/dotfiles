return {
  "jose-elias-alvarez/null-ls.nvim",
  config = function()
    local _util = require("_util")
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.prettier.with({
          filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "json", "markdown",
            "html", "css", "scss", "less", "lua" }
        })
      },
      on_attach = _util.formatIfSupported
    })
  end
}
