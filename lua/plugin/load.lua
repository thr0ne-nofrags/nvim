-- Spec loader for .config/nvim/lua/plugin
local plugins = {}

--------------------------------------------------------------------------------
-- Load plugins
vim.list_extend(plugins, require("plugin.web-devicons"))
--------------------------------------------------------------------------------
-- Call spec loader of subfolders
vim.list_extend(plugins, require("plugin.mini.load"))
--------------------------------------------------------------------------------
return plugins
