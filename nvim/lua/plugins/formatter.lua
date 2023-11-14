return {
  "mhartington/formatter.nvim",
  config = function()
    local prettier = require("formatter.defaults.prettier")

    require("formatter").setup({
      filetype = {
        json = { prettier },
        javascript = { prettier },
        javascriptreact = { prettier },
        typescript = { prettier },
        typescriptreact = { prettier },
        html = { prettier },
        yaml = { prettier }
      }
    })

    local augroup = vim.api.nvim_create_augroup("Formatter_plugin", {})

    vim.api.nvim_create_autocmd("BufWritePost", {
      group = augroup,
      callback = function()
        vim.cmd("FormatWriteLock")
      end,
    })
  end
}
