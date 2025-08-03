-- vim builtin options

-- Line numbers
vim.wo.number = true            -- Enable line numbers
vim.wo.relativenumber = true    -- Set relative numbers
vim.opt.colorcolumn = "80"      -- line length guide
vim.opt.scrolloff = 3
vim.opt.signcolumn = "yes"

-- Text wrapping
vim.opt.wrap = false

-- Tab and indentation settings
vim.opt.tabstop = 4             -- Number of spaces that a <Tab> character counts for
vim.opt.softtabstop = 4         -- How many spaces a tab press or backspace affects when editing text
vim.opt.shiftwidth = 4          -- Number of spaces for auto-indent
vim.opt.expandtab = true        -- Insert spaces instead of <Tab> character

vim.opt.smartindent = true      -- Smart indentation? xd

-- Keep undo history from days upon days
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
vim.opt.undofile = true

-- Searching options 
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Colors
vim.opt.termguicolors = true -- True color support
-- Theme
vim.cmd.colorscheme("unokai") 
-- Fold
vim.opt.foldcolumn = 'auto:8' -- Automatically resize based on needs up to 5.
vim.cmd.highlight("Folded guibg=grey guifg=lightgreen")
vim.cmd.highlight("FoldedColumn guibg=darkgrey guifg=red")

vim.opt.isfname:append("@-@") -- Allows @ and - to be recognized in file names
vim.opt.updatetime = 250


vim.g.netrw_keepdir = 0       -- Fix for copying and moving files in netrw

vim.api.nvim_create_autocmd("FileType", {
	pattern = "netrw",
	callback = function()
		vim.wo.relativenumber = true
	end
})

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

-- highlight flash when yanking
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'highlight when yanking text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
