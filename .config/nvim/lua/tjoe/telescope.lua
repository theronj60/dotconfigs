-- custom telescope functions

local M = {}

M.search_dot = function ()
	require('telescope.builtin').find_files {
		--shorten_path = false,
		cwd = "~/dotconfigs",
		prompt = "~ dotfiles ~",
		hidden = true,
		--- test
		-- layout_strategy = 'horizontal',
		-- layout_options = {
		-- 	preview_width = 0.75,
		-- },
	}
end

return M
