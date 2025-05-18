local deps = require("mini.deps")

deps.later(function()
    deps.add({ source = "mason-org/mason.nvim" })

    require("mason").setup()
end)
