-- Custom block to set up quickfix jumping, tldr this updates the buffer based
-- on the current highlighted item in the quickfix list but doesn't update the
-- jumplist until we navigate away from the quickfix list.

local map = vim.keymap.set

local jumping = false
local was_in_quickfix = false

local function is_quickfix_window()
  local wininfo = unpack(vim.fn.getwininfo(vim.fn.win_getid()))
  return wininfo.quickfix == 1 and wininfo.loclist == 0
end

local function qf_command(command)
  jumping = true
  local current_window = vim.api.nvim_get_current_win()
  pcall(vim.cmd, "keepjumps " .. command)
  vim.api.nvim_set_current_win(current_window)
  jumping = false
end

vim.api.nvim_create_autocmd("FileType", {
  callback = function(opts)
    if is_quickfix_window() then
      local buffer_opts = { silent = true, noremap = false, buffer = opts.buf }
      map("n", "j", function()
        qf_command("cnext")
      end, buffer_opts)

      map("n", "k", function()
        qf_command("cprev")
      end, buffer_opts)

      map("n", "q", function()
        pcall(vim.cmd, "cexpr []")
        pcall(vim.cmd, "cclose")
      end, buffer_opts)
    end
  end
})

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    if is_quickfix_window() then
      was_in_quickfix = true
    elseif was_in_quickfix and jumping == false then
      was_in_quickfix = false
      vim.cmd("normal! m'")
    end
  end
})