vim.cmd[[packadd format.nvim]]
require("format").setup({
	["*"] = {
		{ cmd = { "sed -i 's/[ \t]*$//'" } }, -- remove trailing whitespace
	},
	vim = {
		{
			cmd = { "stylua --config-path ~/.config/nvim/.stylua.toml" },
			-- cmd = { "lua-format -i --config=~/.config/nvim/.luafmt" },
			start_pattern = "^lua << EOF$",
			end_pattern = "^EOF$",
		},
	},
	lua = {
		{
			cmd = { "stylua --config-path ~/.config/nvim/.stylua.toml" },
			-- cmd = { "lua-format -i --config=~/.config/nvim/.luafmt" },
		},
	},
	html = {
		{
			cmd = { "prettier --config ~/.config/nvim/.prettierrc" },
		},
	},
	css = {
		{
			cmd = { "prettier --config ~/.config/nvim/.prettierrc" },
		},
	},
	javascript = {
		{
			cmd = { "prettier --config ~/.config/nvim/.prettierrc" },
		},
	},
})
vim.api.nvim_set_keymap("n", "<leader>fw", "<cmd>FormatWrite<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Format<CR>", { silent = true, noremap = true })
