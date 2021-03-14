vim.cmd[[packadd completion-nvim]]
vim.cmd[[packadd completion-buffers]]
vim.cmd[[packadd completion-tags]]
vim.cmd[[packadd completion-tmux]]

vim.o.completeopt = "menuone,noinsert,noselect"

vim.g.completion_trigger_keyword_length = 1
vim.g.completion_trigger_on_delete = 0
vim.g.completion_timer_cycle = 100

vim.g.completion_enable_auto_popup = 1
vim.g.completion_enable_auto_hover = 1
vim.g.completion_enable_auto_signature = 1
-- possible value: 'UltiSnips', 'Neosnippet', 'vim-vsnip', 'snippets.nvim'
vim.g.completion_enable_snippet = 'vim-vsnip'
-- possible value: "length", "alphabet", "none"
vim.g.completion_sorting = "none"

vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy', 'all'}
vim.g.completion_matching_ignore_case   = 1
vim.g.completion_matching_smart_case    = 1

require"completion".addCompletionSource("month", require("modules.completion.month").complete_item)

vim.g.completion_auto_change_source = 1
vim.g.completion_chain_complete_list = {
    default = {
        { complete_items = { 'lsp', 'snippet', 'path', 'buffers' } },
        { complete_items = { 'tags' } },
        { complete_items = { 'tmux' } },
        { complete_items = { 'month' } },
        { mode = { '<c-,>' } },
        { mode = { '<c-.>' } }
    },
}

vim.api.nvim_exec([[
au Filetype lua setl omnifunc=v:lua.vim.lsp.omnifunc

imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)

" augroup CompletionTriggerCharacter
" autocmd!
" autocmd BufEnter * let g:completion_trigger_character = ['.']
" autocmd BufEnter *.c,*.cpp let g:completion_trigger_character = ['.', '::']
" augroup end

]], false)

