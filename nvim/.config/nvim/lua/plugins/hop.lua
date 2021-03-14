vim.cmd("packadd hop.nvim")
require("hop").setup{}
-- Hop
map{"<space>m", ":HopWord<CR>"}
map{"<space>w", ":HopWord<CR>"}
map{"<space>z", ":HopChar1<CR>"}
map{"<space>1", ":HopChar1<CR>"}
map{"<space>x", ":HopChar2<CR>"}
map{"<space>2", ":HopChar2<CR>"}
map{"<space>p", ":HopPattern<CR>"}
map{"<space>l", ":HopLine<CR>"}

