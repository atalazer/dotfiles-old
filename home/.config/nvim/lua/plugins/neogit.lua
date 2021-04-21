vim.cmd("packadd neogit")

local neogit = require("neogit")

neogit.setup({
    disable_context_highlighting = false,
    disable_signs = false,
    -- customize displayed signs
    signs = {
        -- { CLOSED, OPENED }
        section = { ">", "v" },
        item = { ">", "v" },
        hunk = { "", "" },
    },
    mappings = {
        status = {
            ["q"] = "Close",
            ["1"] = "Depth1",
            ["2"] = "Depth2",
            ["3"] = "Depth3",
            ["4"] = "Depth4",
            ["<tab>"] = "Toggle",
            ["x"] = "Discard",
            ["s"] = "Stage",
            ["S"] = "StageUnstaged",
            ["<c-s>"] = "StageAll",
            ["u"] = "Unstage",
            ["U"] = "UnstageStaged",
            ["$"] = "CommandHistory",
            ["<c-r>"] = "RefreshBuffer",
            ["<enter>"] = "GoToFile",
            ["<c-v>"] = "VSplitOpen",
            ["<c-x>"] = "SplitOpen",
            ["<c-t>"] = "TabOpen",
            ["?"] = "HelpPopup",
            ["p"] = "PullPopup",
            ["P"] = "PushPopup",
            ["c"] = "CommitPopup",
            ["L"] = "LogPopup",
            ["Z"] = "StashPopup",
            ["b"] = "BranchPopup",
        },
    },
})

nmap({ "Gg", "<Cmd>lua require(\"neogit\").open()<CR>" })
nmap({ "Gc", "<Cmd>lua require(\"neogit\").open({ \"commit\" })<CR>" })
nmap({ "Gs", "<Cmd>lua require(\"neogit\").open({ kind = \"vsplit\" })<CR>" })

