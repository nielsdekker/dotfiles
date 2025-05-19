--- @type MiniDep
return {
    source = "mini.nvim",
    now = function()
        local notify = require("mini.notify")

        notify.setup()
        vim.notify = notify.make_notify()
    end
}
