

-- Function to set StatusLine background color
local function set_statusline_bg(color)
	vim.cmd("highlight StatusLine guibg=" .. color .. " guifg=#ffffff")
end

-- When entering INSERT mode
vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		set_statusline_bg("#005f5f")  -- Teal-like color
	end,
})

-- When leaving INSERT mode
vim.api.nvim_create_autocmd("InsertLeave", {
	callback = function()
		set_statusline_bg("#262626")  -- Back to dark grey or theme default
	end,
})

vim.o.termguicolors = true

-- local original_statusline = vim.api.nvim_get_hl(0, { name = "StatusLine" })

-- Then you can restore it later
-- vim.api.nvim_set_hl(0, "StatusLine", original_statusline)

