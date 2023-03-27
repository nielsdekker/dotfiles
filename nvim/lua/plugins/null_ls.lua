return {
  "jose-elias-alvarez/null-ls.nvim",
  config = function()
    local _util = require("_util")
    local null_ls = require("null-ls")

    null_ls.setup({
      null_ls.builtins.completion.spell,
      null_ls.builtins.formatting.prettier,
      on_attach = _util.formatIfSupported
    })
  end
}
