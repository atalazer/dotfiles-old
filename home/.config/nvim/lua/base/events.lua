local cmd = vim.cmd
-- Move to last cursor
cmd([[ au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif ]])

-- Check if file changed when its window is focus, more eager than 'autoread'
cmd([[au FocusGained * checktime]])

-- highlight yanked text for 200ms
cmd([[au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout = 200 })]])

