local status, lualine = pcall(require, "lualine")
if (not status) then return end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'onedark',
    section_separators = {left = '', right = ''},
    component_separators = {left = '|', right = '|'},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch','diff'},
    lualine_c = {
		{
			'filename',
			path = 1
		}
	},
    lualine_x = {
      'encoding',
	  'fileformat',
	  'filetype',
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
   lualine_z = {}
  },
  tabline = {
	lualine_a = {},
	lualine_b = {"buffers"},
	lualine_c = {},
	lualine_x = {},
	lualine_y = {"tabs"},
	lualine_z = {}
  },
  extensions = {'fugitive', 'nerdtree'}
} 
