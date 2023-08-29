return {
	"mhartington/formatter.nvim",
	event = { "BufWritePost" },
	cmd = { "Format", "FormatWrite" },
	config = function(_)
		local group = vim.api.nvim_create_augroup("FormatAutogroup", { clear = true })

		vim.api.nvim_create_autocmd("BufWritePost", {
			command = "FormatWrite",
			group = group,
		})

		-- vim.api.nvim_create_autocmd("BufWritePre", {
		-- 	callback = function()
		-- 		vim.lsp.buf.format()
		-- 	end,
		-- 	group = group,
		-- })

		require("formatter").setup({
			logging = true,
			log_level = vim.log.levels.WARN,
			filetype = {
				elixir = { require("formatter.filetypes.elixir").mixformat },
				lua = { require("formatter.filetypes.lua").stylua },
				html = { require("formatter.filetypes.html").prettier },
				sh = { require("formatter.filetypes.sh").shfmt },
				-- eelixir = {
				-- 	require("formatter.util").withl(require("formatter.defaults").prettier, "html"),
				-- },
				["*"] = {
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			},
		})
	end,
	keys = {
		{ "<leader>fw", ":Format<CR>", silent = true },
		{ "<leader>fW", ":FormatWrite<CR>", silent = true },
	},
}
