local overseer = require("overseer")
overseer.setup()

local function miniPickOverseer()
  local pick = require("mini.pick")

  overseer.template.list({
    dir = vim.fn.getcwd()
  }, function(t)
    local items = vim.tbl_map(function(v)
      return vim.tbl_extend("keep", v, {
        text = v.name,
        name = v.name,
      })
    end, t)

    pick.ui_select(
      items,
      {},
      function(chosen)
        if chosen == nil then
          return
        end

        overseer.open()
        overseer.run_template({
          name = chosen.name,
          prompt = "missing",
        })
      end
    )
  end)
end

return {
  miniPickOverseer = miniPickOverseer
}
