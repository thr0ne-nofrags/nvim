return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
        local configs = require('nvim-treesitter.configs')

        configs.setup({
            -- A list of parser names, or "all" (the listed parsers MUST always be installed)
            ensure_installed = {
                "python", "lua", "rust", "go", "luadoc",
                "vim", "vimdoc", "markdown", "markdown_inline",
                "css", "html", "dockerfile", "yaml", "tmux",
                "query", "sql", "csv", "json",
                "gitcommit", "gitignore",
                "cmake", "c", "cpp",
            },
            modules = {},
            sync_install = false,
            auto_install = true,
            ignore_install = {}, -- List of parsers to ignore installing (or "all")
            indent = { enable = true },
            highlight = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<leader>v", --set to `false` to disable one of the mappings
                    node_incremental = "<leader>n",
                    node_decremental = "<leader>p",
                    scope_incremental = "<leader>N",
                },
            },
        })
    end
}
