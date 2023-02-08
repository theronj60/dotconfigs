-- custom telescope functions

local M = {}

M.search_dot = function ()
	require('telescope.builtin').find_files {
		-- theme = 'dropdown',
		--shorten_path = false,
		cwd = "~/dotconfigs",
		prompt = "~dotfiles~",
		hidden = true,
		file_ignore_patterns = { "%.git" },
		layout_strategy = 'vertical',
		-- layout_options = {
		-- 	preview_width = 0.55,
		-- },
	}
end

M.show_quick = function ()
	require('telescope.config').vim_buffer_qflist {
	}
end

-- previewers.vim_buffer_qflist.new
return M
