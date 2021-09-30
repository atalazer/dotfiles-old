local M = {}
M.setup = function()
    vim.cmd([[
    nmap <expr> f reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_f" : "f"
    nmap <expr> F reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_F" : "F"
    nmap <expr> t reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_t" : "t"
    nmap <expr> T reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_T" : "T"
    ]])
end

M.config = function()
    require("lightspeed").setup({
        jump_to_first_match = true,
        jump_on_partial_input_safety_timeout = 400,
        highlight_unique_chars = false,
        grey_out_search_area = true,
        match_only_the_start_of_same_char_seqs = true,
        limit_ft_matches = 8,
        full_inclusive_prefix_key = "<C-x>",
    })
end

return M
