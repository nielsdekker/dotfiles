-- Mostly a copy-paste of the excellent mini.pick.builtins.buffers. The
-- difference is that this version shows relative path names if possible.
-- Buffers can be opened with a relative or absolute path and LSP's like to use
-- an absolute path and other pickers use a relative path. This became a bit of
-- a mess when opening the buffers view.
local function relativeBufferPicker()
    local pick = require("mini.pick")

    local buffers_output = vim.api.nvim_exec2("buffers", { output = true }).output
    local items = {}
    for _, l in ipairs(vim.split(buffers_output, '\n')) do
        local buf_str, name = l:match('^%s*%d+'), l:match('"(.*)"')
        local buf_id = tonumber(buf_str)

        local expanded = vim.fn.expand(name)
        local cwd = vim.fn.getcwd()
        if (string.find(expanded, cwd) ~= nil) then
            local item = {
                text = string.gsub(expanded, cwd .. "/", ""),
                bufnr = buf_id
            }
            table.insert(items, item)
        else
            local item = {
                text = name,
                bufnr = buf_id
            }
            table.insert(items, item)
        end
    end

    pick.start({
        source = {
            name = "Buffers",
            items = items,
        }
    })
end

return {
    relativeBufferPicker = relativeBufferPicker,
}
