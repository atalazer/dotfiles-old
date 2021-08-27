local dap_install = require("dap-install")

dap_install.setup({
    installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
    verbosely_call_debuggers = false,
})

-- local adapters = { "python" }

-- for _, i in ipairs(adapters) do
--     vim.cmd(":silent! DIInstall " .. i .. "_dbg")
-- end

