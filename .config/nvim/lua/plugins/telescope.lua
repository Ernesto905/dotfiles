-- plugins/telescope.lua:
return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	version = false,
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		-- find
		{
			"<leader>fb",
			"<cmd>Telescope buffers sort_mru=true sort_lastused=true ignore_current_buffer=true<cr>",
			desc = "Buffers",
		},
		{ "<leader>ff", function() require("telescope.builtin").find_files() end,                       desc = "Find Files (Root Dir)" },
		{ "<leader>fF", function() require("telescope.builtin").find_files({ cwd = vim.uv.cwd() }) end, desc = "Find Files (cwd)" },
		{ "<leader>fg", "<cmd>Telescope git_files<cr>",                                                 desc = "Find Files (git-files)" },
		{ "<leader>fr", "<cmd>Telescope oldfiles<cr>",                                                  desc = "Recent" },
		{ "<leader>fR", function() require("telescope.builtin").oldfiles({ cwd = vim.uv.cwd() }) end,   desc = "Recent (cwd)" },
		-- git
		{ "<leader>gc", "<cmd>Telescope git_commits<CR>",                                               desc = "Commits" },
		{ "<leader>gs", "<cmd>Telescope git_status<CR>",                                                desc = "Status" },
		-- search
		{ '<leader>s"', "<cmd>Telescope registers<cr>",                                                 desc = "Registers" },
		{ "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>",                                 desc = "Buffer" },
		{ "<leader>sh", "<cmd>Telescope help_tags<cr>",                                                 desc = "Help Pages" },
		{ "<leader>sH", "<cmd>Telescope highlights<cr>",                                                desc = "Search Highlight Groups" },
		{ "<leader>sj", "<cmd>Telescope jumplist<cr>",                                                  desc = "Jumplist" },
		{ "<leader>sl", "<cmd>Telescope loclist<cr>",                                                   desc = "Location List" },
		{ "<leader>sM", "<cmd>Telescope man_pages<cr>",                                                 desc = "Man Pages" },
		{ "<leader>sm", "<cmd>Telescope marks<cr>",                                                     desc = "Jump to Mark" },
		{ "<leader>so", "<cmd>Telescope vim_options<cr>",                                               desc = "Options" },
		{ "<leader>sR", "<cmd>Telescope resume<cr>",                                                    desc = "Resume" },

		{ "<leader>sw", function() require("telescope.builtin").grep_string({ word_match = "-w" }) end, desc = "Word (Root Dir)" },
		{
			"<leader>sW",
			function()
				require("telescope.builtin").grep_string({
					cwd = vim.uv.cwd(),
					word_match =
					"-w"
				})
			end,
			desc = "Word (cwd)"
		},
		{ "<leader>sw", function() require("telescope.builtin").grep_string() end,                          mode = "v",                       desc = "Selection (Root Dir)" },
		{ "<leader>sW", function() require("telescope.builtin").grep_string({ cwd = vim.uv.cwd() }) end,    mode = "v",                       desc = "Selection (cwd)" },
		{ "<leader>uC", function() require("telescope.builtin").colorscheme({ enable_preview = true }) end, desc = "Colorscheme with Preview" },
		{
			"<leader>ss",
			function()
				require("telescope.builtin").lsp_document_symbols()
			end,
			desc = "Goto Symbol",
		},
		{
			"<leader>sS",
			function()
				require("telescope.builtin").lsp_dynamic_workspace_symbols()
			end,
			desc = "Goto Symbol (Workspace)",
		},
	},
	opts = {
	},
	config = function(_, opts)
		require("telescope").setup(opts)
	end,
}
