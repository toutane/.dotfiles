return {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			-- Default options:
			require("gruvbox").setup({
				terminal_colors = true, -- add neovim terminal colors
				undercurl = true,
				underline = true,
				bold = true,
				italic = {
					strings = true,
					emphasis = true,
					comments = true,
					operators = false,
					folds = true,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true, -- invert background for search, diffs, statuslines and errors
				contrast = "hard", -- can be "hard", "soft" or empty string
				palette_overrides = {},
				overrides = {},
				dim_inactive = false,
				transparent_mode = true,
			})

			-- vim.cmd([[colorscheme gruvbox]])
		end,
	},
	{
		"Mofiqul/vscode.nvim",
		priority = 1000,
		config = function()
			-- local c = require("vscode.colors").get_colors()
			require("vscode").setup({
				transparent = true,
				italic_comments = true,
				underline_links = true,
				disable_nvimtree_bg = true,
				-- color_overrides = {
				--     vscLineNumber = '#FFFFFF',
				-- },
				-- group_overrides = {
				--     -- this supports the same val table as vim.api.nvim_set_hl
				--     -- use colors from this colorscheme by requiring vscode.colors!
				--     Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
				-- }
			})

			vim.cmd([[colorscheme vscode]])
		end,
	},
}
