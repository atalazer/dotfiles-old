local fn = vim.fn

-- local path = fn.stdpath("data") .. "/site/pack/deps/opt"
local path = fn.stdpath("data") .. "/site/pack/packer/opt"

function bootstrap(user, repo)
    local package = path .. "/" .. repo
    if fn.empty(fn.glob(package)) > 0 then
        fn.system({ "git", "clone", "--depth=1", string.format("https://github.com/%s/%s", user, repo), package })
    end
    vim.cmd("packadd " .. repo)
end

-- bootstrap("chiyadev", "dep")

bootstrap("wbthomason", "packer.nvim")
-- bootstrap("lewis6991", "impatient.nvim")
-- bootstrap("b0o", "mapx.nvim")
-- bootstrap("gpanders", "editorconfig.nvim")
