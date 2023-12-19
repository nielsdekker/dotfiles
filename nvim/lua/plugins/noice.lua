return {
  "folke/noice.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim"
  },
  config = function()
    require("noice").setup({
      presets = {
        lsp_doc_border = false
      }
    })
  end
}
