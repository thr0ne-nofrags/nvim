--[[ 
Makes user made folds persistent after exiting
Applies to nvim's built-in folding feature.
--]]

vim.api.nvim_create_autocmd("BufWinLeave", {
  pattern = "*",
  callback = function()
    if vim.bo.filetype ~= "markdown" and vim.fn.expand("%") ~= "" and vim.fn.expand("%:p") ~= "" then
      vim.cmd("mkview")
    end
  end,
})


vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "*",
	callback = function()
    if vim.bo.filetype ~= "markdown" then
      vim.cmd("silent! loadview")
    end
	end,
})
