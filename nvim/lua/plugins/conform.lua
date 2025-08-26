local formatters_for_frontend = { "prettier" }

--- @type MiniDep
return {
    source = "stevearc/conform.nvim",
    later = function()
        require("conform").setup({
            format_on_save = {
                timeout_ms = 3000,
                lsp_format = "fallback",
            },
            formatters_by_ft = {
                json = { "prettier" },
                javascript = formatters_for_frontend,
                typescript = formatters_for_frontend,
                javascriptreact = formatters_for_frontend,
                typescriptreact = formatters_for_frontend,
                html = { "prettier" },
                yaml = { "prettier" },
                markdown = { "prettier" },
                templ = { "templ" },
                go = { "gofmt" },
                kotlin = { "ktfmt" },
                java = { "google-java-format" },
                sql = { "sql_formatter" },
                helm = { "prettier" },
            },
            formatters = {
                ktfmt = {
                    inherit = true,
                    prepend_args = { "--kotlinlang-style" },
                }
            }
        })
    end
}
