--[[                  Neovim configuration by .thr0ne
                          .config/nvim/init.lua
--------------------------------------------------------------------------------
This file is the first loaded by nvim. Here we are importing lua modules using 
the require() function. 
  ! Lua Module !
  - A file that returns a table.
  - Meant to be loaded with require()
]]
--------------------------------------------------------------------------------
require("config.vim")
require("config.remap")
require("config.lazy")    -- Load the package manager (lazy.nvim)
require("config.autocmd")
--------------------------------------------------------------------------------
