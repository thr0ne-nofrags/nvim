return {
  "ibhagwan/fzf-lua",
  dependencies = { "echasnovski/mini.icons" },
  opts = {
    devicons = {
      get_icons = function()
        return require('mini.icons').get_icons_by_filename
      end,
    },
  },
  keys = {
    {
      "<leader>ff",
      function() require('fzf-lua').files() end,
      desc = "Find files in Current Working Directory."
    },
    {
      "<leader>fs",
      function() require('fzf-lua').live_grep() end,
      desc = "Live string matching in project dir with ripgrep."
    },
    {
      "<leader><leader>",
      function() require('fzf-lua').buffers() end,
      desc = "Navigate open buffers."
    },
    -- Git menus
    {
      "<leader>fgb",
      function() require('fzf-lua').git_branches() end,
      desc = "Search git branches."
    },
    {
      "<leader>fgc",
      function() require('fzf-lua').git_commits() end,
      desc = "Search git commits."
    },
    {
      "<leader>fgf",
      function() require('fzf-lua').git_files() end,
      desc = "Search git files."
    },
    {
      "<leader>fgs",
      function() require('fzf-lua').git_status() end,
      desc = "Search git status."
    },
    -- LSP menus
    -- {
    --   "<leader>flr",
    --   function() require('fzf-lua').lsp_references() end,
    --   desc = "Search references."
    -- },
    -- {
    --   "<leader>fld",
    --   function() require('fzf-lua').lsp_definitions() end,
    --   desc = "Search definitions."
    -- },
    -- {
    --   "<leader>flD",
    --   function() require('fzf-lua').lsp_declarations() end,
    --   desc = "Search declarations."
    -- },
    -- {
    --   "<leader>fli",
    --   function() require('fzf-lua').lsp_implementations() end,
    --   desc = "Search implementations."
    -- },
    -- {
    --   "<leader>fls",
    --   function() require('fzf-lua').lsp_document_symbols() end,
    --   desc = "Search document symbols."
    -- },
    -- {
    --   "<leader>flS",
    --  function() require('fzf-lua').lsp_live_workspace_symbols() end,
    --   desc = "Search workspace symbols."
    -- },
    -- {
    --   "<leader>fle",
    --  function() require('fzf-lua').diagnostics_document() end,
    --   desc = "Search dianostics in document."
    -- },
    -- {
    --   "<leader>flE",
    --  function() require('fzf-lua').diagnostics_workspace() end,
    --   desc = "Search dianostics in workspace."
    -- },
  }
}

