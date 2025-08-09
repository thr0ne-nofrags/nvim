-- indentation settings
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c", "cpp", "h", "lua" },
	callback = function()
		vim.bo.shiftwidth = 2
		vim.bo.tabstop = 2
		vim.bo.softtabstop = 2
		vim.bo.expandtab = true -- use spaces instead of tabs
	end,
})
