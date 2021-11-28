
-- Cycle tab
nnoremap("<C-PageUp>", "<CMD>BufferLineCyclePrev<CR>")
nnoremap("<C-PageDown>", "<CMD>BufferLineCycleNext<CR>")

-- Move tab
nnoremap("<C-Home>", "<CMD>BufferLineMovePrev<CR>")
nnoremap("<C-End>", "<CMD>BufferLineMoveNext<CR>")

nnoremap("<A-1>", "<CMD>lua require'bufferline'.go_to_buffer(1)<CR>")
nnoremap("<A-2>", "<CMD>lua require'bufferline'.go_to_buffer(2)<CR>")
nnoremap("<A-3>", "<CMD>lua require'bufferline'.go_to_buffer(3)<CR>")
nnoremap("<A-4>", "<CMD>lua require'bufferline'.go_to_buffer(4)<CR>")
nnoremap("<A-5>", "<CMD>lua require'bufferline'.go_to_buffer(5)<CR>")


-- ------------------------------------- Function
nnoremap("<F1>", [[<CMD>lua Util.session.last()<CR><CMD>echo "Session Restored"<CR>]])
nnoremap("<F2>", [[<CMD>lua Util.session.save()<CR><CMD>echo "Session Saved"<CR>]])
nnoremap("<F4>", [[<CMD>lua Util.open()<CR><CMD>echo "Open Current File ..."<CR>]])

-- -- ----------------------------------------- Notes
nnoremap("<Leader>ni", Util.notes.index)
nnoremap("<Leader>nn", [[<CMD>lua Util.notes.search("notes")<CR>]])
nnoremap("<Leader>ns", [[<CMD>lua Util.notes.search("school")<CR>]])
