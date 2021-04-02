vim.cmd("packadd nvim-colorizer.lua")

require("colorizer").setup {
  ["*"] = {
    css = true,
    css_fn = true,
    mode = "background",
  },
}
-- Colorizer
nnoremap{"<leader>cc", ":ColorizerToggle<CR>" }
nnoremap{"<leader>cd", ":ColorizerDetachFromBuffer<CR>" }
nnoremap{"<leader>ca", ":ColorizerAttachToBuffer<CR>" }
nnoremap{"<leader>cr", ":ColorizerReloadAllBuffers<CR>" }

