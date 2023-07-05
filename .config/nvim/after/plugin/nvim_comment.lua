-- nvim comment setup
-- needs work
require'nvim_comment'.setup {
	comment_empty = false,
	hook = function()
		if vim.api.nvim_buf_get_option(0, "filetype") == "vue" then
			vim.api.nvim_buf_set_option(0, "commentstring", "<!-- %s -->")
		end
		if vim.api.nvim_buf_get_option(0, "filetype") == "astro" then
			vim.api.nvim_buf_set_option(0, "commentstring", "<!-- %s -->")
		end
		if vim.api.nvim_buf_get_option(0, "filetype") == "blade" then
			vim.api.nvim_buf_set_option(0, "commentstring", "{{-- %s --}}")
		end
		if vim.api.nvim_buf_get_option(0, "filetype") == "php" then
			vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
		end
	end
}
