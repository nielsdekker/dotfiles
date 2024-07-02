---@param callback fun(data: table<{integer, { text: string, trigger: fun()}}>)
local function getOverseerTemplates(callback)
  local overseer = require("overseer")

  overseer.template.list({
    dir = vim.fn.getcwd()
  }, function(items)
    local data = vim.tbl_map(function(it)
      return {
        text = it.name,
        trigger = function()
          overseer.open()
          overseer.run_template({
            name = it.name,
            prompt = "allow"
          })
        end
      }
    end, items)

    callback(data);
  end)
end

return {
  getOverseerTemplates = getOverseerTemplates
}
