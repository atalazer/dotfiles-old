vim.cmd([[packadd firenvim]])

if vim.fn.exists("g:started_by_firenvim") == 1 then
  vim.cmd[[set laststatus=0]]
  vim.cmd[[set showtabline=0]]
end

vim.g.firenvim_config = {
    globalSettings = {
        alt = 'all',
    },
    localSettings = {
        [".*"] = {
            cmdline  = "neovim",
            context  = "text",
            selector = "textarea",
            takeover = "never",
            priority = 1
        },
    }
}

vim.cmd([[au BufEnter github.com_*.txt set filetype=markdown]])
vim.cmd([[au BufEnter e.smpn1boyolali.sch.id_*.txt set filetype=markdown]])

