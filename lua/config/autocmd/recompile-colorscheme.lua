vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "lua/plugins/colorscheme.lua",
  callback = function ()
    vim.cmd("KanagawaCompile")
    vim.notify("Kanagawa colorscheme recompiled.", vim.log.levels.INFO)
  end,
})
