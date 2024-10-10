return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		-- "nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<C-h>"] = "which_key",
					},
				},
				k,
			},
		})

		telescope.load_extension("fzf")

		-- vim.keymap.set("n", "<leader>pf", "<cmd>Telescope find_files<cr>")
		-- vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>")
		-- vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
		-- vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
		-- vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
	end,
}
