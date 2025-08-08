-- ~/.config/nvim/lua/config/markdown.lua

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    -- Spellcheck, soft wrap
    vim.opt_local.spell = true
    vim.opt_local.wrap = true
  end,
})

