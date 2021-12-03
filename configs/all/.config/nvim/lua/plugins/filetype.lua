require("filetype").setup({
    overrides = {
        function_extensions = {
            ["pdf"] = function()
                vim.bo.filetype = "pdf"
                vim.fn.jobstart(
                    "defapps run pdf " .. '"' .. vim.fn.expand("%") .. '"'
                )
            end,
        },
        shebang = {
            sh = "sh",
            dash = "sh",
        },
    },
})
