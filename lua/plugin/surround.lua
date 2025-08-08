return {
  "echasnovski/mini.surround",
  version = false,
  config = function()
    require('mini.surround').setup(
      -- No need to copy this inside `setup()`. Will be used automatically.
      {
        -- Add custom surroundings to be used on top of builtin ones. For more
        -- information with examples, see `:h MiniSurround.config`.
        custom_surroundings = nil,

        -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
        highlight_duration = 1200,

        -- Module mappings. Use `''` (empty string) to disable one.
        mappings = {
          add = 'sa', -- Add surrounding in Normal and Visual modes
          delete = 'sd', -- Delete surrounding
          find = 'sf', -- Find surrounding (to the right)
          find_left = 'sF', -- Find surrounding (to the left)
          highlight = 'sh', -- Highlight surrounding
          replace = 'sr', -- Replace surrounding
          update_n_lines = 'sn', -- Update `n_lines`

          suffix_last = 'l', -- Suffix to search with "prev" method
          suffix_next = 'n', -- Suffix to search with "next" method
        },

        -- Number of lines within which surrounding is searched
        n_lines = 200,

        respect_selection_type = true, --[[
        Boolean option `config.respect_selection_type` controls whether to respect
        selection type when adding and deleting surrounding. When enabled:
        - Linewise adding places surroundings on separate lines while indenting
        surrounded lines ones.
        - Deleting surroundings which look like they were the result of linewise
        adding will act to revert it: delete lines with surroundings and dedent
        surrounded lines ones.
        - Blockwise adding places surroundings on whole edges, not only start and
      end of selection. Note: it doesn't really work outside of text and in
      presence of multibyte characters; and probably won't due to
      implementation difficulties.
      ]]
      -- How to search for surrounding (first inside current line, then inside
      -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
      -- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
      -- see `:h MiniSurround.config`.
      search_method = 'cover',

      -- Whether to disable showing non-error feedback
      -- This also affects (purely informational) helper messages shown after
      -- idle time if user input is required.
      silent = false,
    }
  )
end
}
