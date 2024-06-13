local function setup()
  local overseer = require("overseer")

  overseer.setup()

  return overseer
end

local function miniPickOverseer()
  local overseer = setup()
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

    pick.start({
      source = {
        name = "Run task",
        items = items,
        choose = function(chosen)
          overseer.run_template({
            name = chosen.name,
            buf_nr = 1,

            -- Never prompt. Some issue with overseer not knowing which buffer
            -- to use. Understandable because the buffer probably points to
            -- a closed mini.pick window
            prompt = "allow",
          })
          vim.defer_fn(function()
            overseer.open()
          end, 5)
        end
      },
    })
  end)
end

return {
  setup = setup,
  miniPickOverseer = miniPickOverseer
}
