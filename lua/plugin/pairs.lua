-- mini.pairs plugin 
-- ~/.config/nvim/lua/plugin/mini/pairs.lua

return {
  "echasnovski/mini.pairs",
  version = false,
  config = function()
    require("mini.pairs").setup()
  end,
}
