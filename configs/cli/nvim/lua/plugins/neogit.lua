local neogit = require("neogit")

neogit.setup({
    disable_signs = false,
    disable_context_highlighting = true,
    disable_commit_confirmation = false,
    disable_builtin_notifications = false,
    auto_refresh = true,
    commit_popup = {
        kind = "split",
    },
    -- Plugins Integrations
    integrations = {
        diffview = true,
    },
    -- Customize Displayed Signs
    signs = {
        -- { CLOSED, OPENED }
        section = { "", "" },
        item = { "+", "-" },
        hunk = { "", "" },
    },
    -- Override/Add Mappings
    -- mappings = {}
})
