-- LSP configuration
-- Get this plugin -> https://github.com/neovim/nvim-lspconfig
--
vim.lsp.enable('rust_analyzer')

vim.diagnostic.config({
	-- 1. Inline messages (“virtual text”) ---------------------------------------
	virtual_text = false,

	-- 2. Supplementary UI channels (all optional) -------------------------------
	signs          = true,          -- gutter icons
	underline      = true,          -- underline offending text
	update_in_insert = false,       -- speed vs. accuracy trade-off
	severity_sort  = true           -- highest severity on top
})

vim.api.nvim_create_autocmd('LspAttach',{
	callback = function(args)
		vim.keymap.set( 'n', 'grd', vim.diagnostic.open_float )
		vim.o.signcolumn = 'yes'

		vim.keymap.set( 'n', '<F7>', '<Plug>(TermwTest)<Enter>' )
	end
})

