require("lightspeed").setup({
    exit_after_idle_msecs = { labeled = nil, unlabeled = 1000 },

    -- s/x
    match_only_the_start_of_same_char_seqs = true,
    -- substitute_chars = { ["\r"] = "¬" },
    -- safe_labels = { ... },
    -- labels = { ... },

    -- f/t
    limit_ft_matches = 4,
    repeat_ft_with_target_char = false,
})

vim.cmd([[
    nmap <expr> f reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_f" : "f"
    nmap <expr> F reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_F" : "F"
    nmap <expr> t reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_t" : "t"
    nmap <expr> T reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_T" : "T"
]])
