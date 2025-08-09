-- .thr0ne's key mappings
--
vim.g.mapleader = " " -- set leader key to [SPACE]

vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "File Explorer"}) -- Open file explorer
-- _____________________________________________________________________________
-- Move selected lines up and down with K and J. Will auto-indent.
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- _____________________________________________________________________________
-- Keep cursor in the middle when jumping to next or previous search item
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Indenting in visual mode doesn't cancel selection
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Press <leader>p in visual mode to paste over something but not put it in paste buffer
vim.keymap.set("x", "<Leader>p", "\"_dP")

-- Press <leader>y to yank into system clipboard
vim.keymap.set("n", "<Leader>y", "\"+y")
vim.keymap.set("v", "<Leader>y", "\"+y")

-- -- Normal mode: Replace every occurrence of the word under cursor literally
-- vim.keymap.set("n", "<Leader>s",
--   [[:%s#\V<C-r><C-w>#<C-r><C-w>#gI<Left><Left><Left>]],
--   { noremap = true, silent = false })



-- Yank visual selection into unnamed register (usually automatic)
vim.keymap.set("v", "<Leader>s", function()
  vim.cmd('normal! y')
  local selection = vim.fn.getreg('"')
  selection = selection:gsub('#', '\\#')

  local cmd = string.format("%%s#\\V%s#%s#gI", selection, selection)

  -- Replace termcodes for keys including ':'
  local keys = vim.api.nvim_replace_termcodes(':' .. cmd .. '<Left><Left><Left>', true, false, true)

  -- Feed keys in normal mode, now properly opening command-line mode
  vim.fn.feedkeys(keys, 'n')
end, { noremap = true, silent = false })



-- Toggle line wrapping
vim.keymap.set("n", "<leader>L", ":set wrap!<CR>", { desc = "Toggle line wrap" })

-- map <leader>w to window controls <C-w>
vim.keymap.set("n", "<Leader>w", "<C-w>")

-- <leader>jkhl to change window
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-l>', '<C-w>l')
-- ctrl + up/down/left/right to resize window height/width
vim.keymap.set('n', '<A-l>', ':vertical resize +1<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-h>', ':vertical resize -1<CR>', { noremap = true, silent = true })
vim.keymap.set('t', '<A-k>', '<C-\\><C-n>:vertical resize +1<CR>', { noremap = true, silent = true })
vim.keymap.set('t', '<A-j>', '<C-\\><C-n>:vertical resize -1<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-k>', ':resize +1<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-j>', ':resize -1<CR>', { noremap = true, silent = true })

-- dh = Attach the beginning of the current line to end of the previous line.
vim.keymap.set('n', 'dh', '0dwi<BS><Esc>')

-- C-h and C-l move left and right in insert, command and terminal modes
vim.keymap.set('i', '<C-j>', '<Down>')
vim.keymap.set('i', '<C-k>', '<Up>')
vim.keymap.set('i', '<C-h>', '<Left>')
vim.keymap.set('i', '<C-l>', '<Right>')

vim.keymap.set('c', '<C-h>', '<Left>')
vim.keymap.set('c', '<C-l>', '<Right>')
vim.keymap.set('t', '<C-h>', '<Left>')
vim.keymap.set('t', '<C-l>', '<Right>')
-- Unbind keys
vim.keymap.set("n", "Q", "<nop>") -- Unbind Q


-- Function opens terminal or switches focus to the open terminal
local function toggle_terminal()
  -- Check if a terminal buffer already exists
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].buftype == "terminal" then
      vim.api.nvim_set_current_win(win)
      vim.cmd("startinsert")
      return
    end
  end
  --
  vim.cmd("10split | terminal")
  vim.cmd("startinsert")
end

-- Open and close terminal
vim.keymap.set("n", "<Leader>t", toggle_terminal, {noremap=true, silent=true})
vim.keymap.set("t", "<Esc>", "<C-\\><C-n><C-w>j")
-- vim.keymap.set("t", "<C-j>", "<C-\\><C-j>")

-- Helper: find a visible terminal window, else return nil
local function get_terminal_winid()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].buftype == "terminal" then
      return win
    end
  end
  return nil
end

-- Compile and run C/C++ in (existing) terminal, or open a new one if needed
local function compile_and_run()
  vim.cmd("w") -- Save current file

  local file_path = vim.fn.expand("%:p")
  local file_root = vim.fn.expand("%:r")
  local file_ext = vim.fn.expand("%:e")

  local compile_cmd, run_cmd
  if file_ext == "c" then
    compile_cmd = "gcc \"" .. file_path .. "\" -o \"" .. file_root .. "\""
    run_cmd = "\"./" .. vim.fn.fnamemodify(file_root, ":t") .. "\"\n"
  elseif file_ext == "cpp" or file_ext == "cc" or file_ext == "cxx" then
    compile_cmd = "g++ -std=c++17 \"" .. file_path .. "\" -o \"" .. file_root .. "\""
    run_cmd = "\"./" .. vim.fn.fnamemodify(file_root, ":t") .. "\"\n"
  else
    print("Not a C or C++ file.")
    return
  end

  -- Try to get an existing terminal window, else open new
  local term_win = get_terminal_winid()
  local term_job_id

  if term_win then
    vim.api.nvim_set_current_win(term_win)
    term_job_id = vim.b.terminal_job_id
  else
    vim.cmd("split | terminal")
    term_job_id = vim.b.terminal_job_id
  end

  -- Send all commands at once to avoid race conditions
  vim.fn.chansend(term_job_id, "clear; " .. compile_cmd .. " && " .. run_cmd)

  -- Ensure we are in terminal insert mode
  vim.cmd("startinsert")
end

vim.api.nvim_create_user_command("RunCOrCpp", compile_and_run, {})
vim.keymap.set("n", "<leader>r", ":RunCOrCpp<CR>", { noremap = true, silent = true })
