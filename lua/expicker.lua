local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local actions_state = require "telescope.actions.state"

-- local list = vim.iter(require('exlist')):map(function (v)
--     return v[1] .. "|" .. v[2] .. "|" .. v[3]
-- end):totable()
local list = require 'exlist'

local colors = function (opts)
    opts = opts or {}
    pickers.new(opts, {
	prompt_title = "colors",
	finder = finders.new_table {
	    results = list,
	    entry_maker = function (e)
	    	return {
		    value = e,
		    display = e[2] .. "\t\t" .. e[3],
		    ordinal = e[1],
		}
	    end
	},
	sorter = conf.generic_sorter(opts),
	attach_mappings = function (prompt_bufnr, map)
	    actions.select_default:replace(function ()
	    	actions.close(prompt_bufnr)
		local selection = actions_state.get_selected_entry()
		-- vim.api.nvim_put({selection[1]}, "", false, true)
		print(selection)
	    end)
	    return true
	end
    }):find()
end

-- colors(require 'telescope.themes'.get_dropdown({}))
colors()

