return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		local clang_format_style = {
			BasedOnStyle = "Google",
			IndentWidth = 4,
			TabWidth = 4,
			UseTab = "Never",
			ColumnLimit = 80,
			AccessModifierOffset = -8,
			IndentCaseLabels = false,
			NamespaceIndentation = "None",
			BreakBeforeBraces = "Linux",
			AllowShortFunctionsOnASingleLine = "None",
		}

		conform.setup({
			formatters_by_ft = {
				c = { "clang-format" },
				cpp = { "clang-format" },
				cmake = { "cmake_format" },
				lua = { "stylua" },
				python = { "isort", "black" },
			},
			formatters = {
				clang_format = {
					prepend_args = { "--style=" .. vim.json.encode(clang_format_style) },
				},
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})
		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
