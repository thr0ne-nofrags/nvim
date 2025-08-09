-- ~/.config/nvim/lua/config/autocmd.lua
if _G.__autocmds_loaded then
  return
end
_G.__autocmds_loaded = true

local autocmd_dir = vim.fn.stdpath("config") .. "/lua/config/autocmd"

for _, file in ipairs(vim.fn.glob(autocmd_dir .. "/*.lua", true, true)) do
  dofile(file)
end
