--- @class MiniDep
---
--- Settings specific to mini.deps
--- @field source string
--- @field name? string
--- @field checkout? string
--- @field depends? string[]
--- @field hooks? { post_checkout?: function }
---
--- Own settings
--- @field now? function
--- @field later? function

--- @type MiniDep[]
return {
    require("deps.blink"),
    require("deps.codecompanion"),
    require("deps.conform"),
    require("deps.dap"),
    require("deps.detekt"),
    require("deps.gitsigns"),
    require("deps.kanso"),
    require("deps.mason"),
    require("deps.mini_diff"),
    require("deps.mini_files"),
    require("deps.mini_icons"),
    require("deps.mini_notify"),
    require("deps.mini_pick"),
    require("deps.mini_starter"),
    require("deps.mini_statusline"),
    require("deps.mini_surround"),
    require("deps.minuet"),
    require("deps.neogit"),
    require("deps.render-markdown"),
    require("deps.rose-pine"),
    require("deps.treesitter"),
    require("deps.undotree"),
}
