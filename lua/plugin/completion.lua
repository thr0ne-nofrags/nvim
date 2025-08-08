return {
  'saghen/blink.cmp',
  dependencies = {
    'rafamadriz/friendly-snippets',
  },

  version = '1.*',

  opts = {
    keymap = {
      preset = 'default'
    },
    appearance = {
      nerd_font_variant = 'mono'
    },
    cmdline = {
      keymap = { preset = 'inherit' },
      completion = { menu = { auto_show = true } }
    },
    completion = {
      documentation = { auto_show = false },
      keyword = { range = 'prefix'},
      ghost_text = { enabled = true },
    },
    -- TERMINAL SETTINGS
    term = {
      enabled = true,
      keymap = { preset = 'inherit' }, -- Inherits from top level `keymap` config when not set
      sources = {},
      completion = {
        trigger = {
          show_on_blocked_trigger_characters = {},
          show_on_x_blocked_trigger_characters = nil, -- Inherits from top level `completion.trigger.show_on_blocked_trigger_characters` config when not set
        },
        -- Inherits from top level config options when not set
        list = {
          selection = {
            -- When `true`, will automatically select the first item in the completion list
            preselect = nil,
            -- When `true`, inserts the completion item automatically when selecting it
            auto_insert = nil,
          },
        },
        -- Whether to automatically show the window when new completion items are available
        menu = { auto_show = true },
        -- Displays a preview of the selected item on the current line
        ghost_text = { enabled = true },
      }
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer'},
    },
    fuzzy = {
      implementation = "prefer_rust_with_warning",
      prebuilt_binaries = {
        download = true
      }
    },
    signature = {
      enabled = true
    }
  },

  opts_extend = {
    "sources.default"
  },

  config = function(_, opts)
    require("blink.cmp").setup(opts)
  end,
}



