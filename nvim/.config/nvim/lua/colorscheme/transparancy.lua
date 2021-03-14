local set_hl = require('colorscheme.utils').set_hl

local transparancy = function()
	local highlights = {
		{ "Normal", { bg = "NONE" } },
		{ "SignColumn", { bg = "NONE" } },
		{ "EndOfBuffer", { bg = "NONE" } },
		{ "Folded", { gui = "NONE" } },
		{ "Comment", { gui = "italic" } },
	}

	for _, highlight in ipairs(highlights) do
		set_hl(highlight[1], highlight[2])
	end
end

transparancy()

