return {
  -- plugin: auto-save.nvim
  -- function: auto save changes
  -- src: https://github.com/pocco81/auto-save.nvim
  "Pocco81/auto-save.nvim",
  config = function()
    require("auto-save").setup({
      enabled = false
    })
  end,
}