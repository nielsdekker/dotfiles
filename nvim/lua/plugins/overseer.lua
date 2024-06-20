local overseer = require("overseer")
overseer.setup()

local function miniPickOverseer()
  local pick = require("mini.pick")

  overseer.template.list({
    dir = vim.fn.getcwd()
  }, function(items)
    vim.tbl_map(function(it)
      it.text = it.name
    end, items)

    pick.ui_select(
      items,
      {
        prompt = "Run task"
      },
      function(chosen)
        if chosen == nil then
          return
        end

        overseer.open()
        overseer.run_template({
          name = chosen.name,
          prompt = "allow",
        })
      end
    )
  end)
end

return {
  miniPickOverseer = miniPickOverseer
}
