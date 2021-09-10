local present, ts_config = pcall(require, "nvim-treesitter.configs")

if not present then
    return
end

ts_config.setup({
    ensure_installed = {
        "javascript",
        "typescript",
        "svelte",
        "tsx",
        "html",
        "css",
        "scss",
        "cpp",
        "c",
        "go",
        "rust",
        "python",
        "lua",
        "bash",
        "toml",
        "yaml",
        "latex",
        "nix",
        "json",
        "jsonc",
        "query",
        "comment",
    },
    indent = { enable = true },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<Enter>",
            node_incremental = "<Enter>",
            node_decremental = "<BS>",
        },
    },
    matchup = { enable = true },
    autopairs = { enable = true },
    autotag = { enable = true },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    refactor = {
        highlight_definitions = { enable = false },
        highlight_current_scope = { enable = false },
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = "gR",
            },
        },
        navigation = {
            enable = false,
            keymaps = {
                goto_definition = "gnd",
                list_definitions = "gnD",
                list_definitions_toc = "gO",
                goto_next_usage = "<a-*>",
                goto_previous_usage = "<a-#>",
            },
        },
    },
})
