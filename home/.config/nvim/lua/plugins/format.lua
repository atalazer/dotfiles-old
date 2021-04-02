vim.cmd([[packadd format.nvim]])

local tempdir = "/tmp"
local remove_whitespace = { { cmd = { "sed -i 's/[ \t]*$//'" } } }
local prettier = { { cmd = { "prettier -w" }, tempfile_dir = tempdir } }
local shfmt = {
    {
        cmd = {
            function(file)
                return string.format("shfmt -i %s -w '%s'", vim.bo.shiftwidth, file)
            end,
        },
        tempfile_dir = tempdir,
    },
}
local stylua = {
    {
        cmd = {
            function(file)
                local config = os.getenv("HOME") .. "/.config/nvim/.stylua.toml"
                return string.format("stylua --config-path %s %s %s ", config, file, file)
            end,
        },
        tempfile_dir = tempdir,
    },
}

local markdownfmt = {
    { cmd = { "prettier -w" }, tempfile_dir = tempdir },
    {
        cmd = { "black" },
        start_pattern = "^```python$",
        end_pattern = "^```$",
        target = "current",
        tempfile_dir = tempdir,
    },
}
local black = { { cmd = { "black" }, tempfile_dir = tempdir } }

require("format").setup({
    ["*"] = remove_whitespace,
    javascript = prettier,
    typescript = prettier,
    html = prettier,
    css = prettier,
    sh = shfmt,
    lua = stylua,
    markdown = markdownfmt,
    json = prettier,
    python = black,
})
vim.api.nvim_set_keymap("n", "<leader>fw", "<cmd>FormatWrite<CR>", { silent = false, noremap = false })
vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Format<CR>", { silent = false, noremap = false })
