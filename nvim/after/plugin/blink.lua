local deps = require("mini.deps")

deps.now(function()
    deps.add({ source = "saghen/blink.cmp", checkout = "v1.3.0" })

    require("blink.cmp").setup({
        completion = {
            documentation = { auto_show = true },
            accept = { auto_brackets = { enabled = false } },
            list = { selection = { preselect = false, auto_insert = true } },

            -- Make sure the winblend option also affects blink.cmp
            menu = { winblend = vim.o.winblend },
        },
        keymap = {
            preset = "default",
            ["<Tab>"] = { "select_next", "fallback" },
            ["<S-Tab>"] = { "select_prev", "fallback" },
            ["<CR>"] = { "accept", "fallback" },
        },
        sources = {
            default = { "lsp", "path", "buffer" },
            per_filetype = {
                codecompanion = { "codecompanion" }
            }
        }
    })
end)
