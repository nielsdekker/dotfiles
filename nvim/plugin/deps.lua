local add, later, now =
    require("mini.deps").add,
    require("mini.deps").later,
    require("mini.deps").now

local deps = require("deps.init")

for _, v in ipairs(deps) do
    -- Skip installing mini.nvim cause it is already installed
    if v.source ~= "mini.nvim" then
        add({
            source = v.source,
            name = v.name,
            depends = v.depends,
            checkout = v.checkout,
            hooks = v.hooks,
        })
    end

    if v.now ~= nil then now(v.now) end
    if v.later ~= nil then later(v.later) end
end
