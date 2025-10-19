-- Aliases
o = vim.o
c = vim.cmd
a = vim.api
g = vim.g

-- Settings
o.number = true
o.tabstop = 4
o.shiftwidth = 0

o.background = 'dark'
c.colorscheme 'carbonfox'

-- Some utility functions

-- 	load a module under lua/
function mod(modname)
	status, _ = pcall(require, modname)
	if not status then
		print('Module ', modname, ' not loaded')
	end
end

-- Stauts Line
mod 'status'

-- Generic Mappings
mod 'mappings'

-- LSP config through 'nvim-lspconfig'
mod 'lsp'
