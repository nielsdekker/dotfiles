require("mini.deps").now(function()
    local conform = require("conform")

    conform.setup({
        format_on_save = {
            timeout_ms = 1000,
            lsp_format = "fallback",
        },
        formatters_by_ft = {
            json = { "prettier" },
            javascript = { "prettier" },
            typescript = { "prettier" },
            javascriptreact = { "prettier" },
            typescriptreact = { "prettier" },
            html = { "prettier" },
            yaml = { "prettier" },
            markdown = { "prettier" },
            templ = { "templ" },
            go = { "gofmt" }
        }
    })
end)
