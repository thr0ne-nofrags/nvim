return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    -- no special devicons config needed, fzf-lua uses web-devicons by default if installed
  },
  keys = {
    {
      "<leader>ff",
      function() require('fzf-lua').files() end,
      desc = "Find files in Current Working Directory."
    }
  }
}

