return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for filesystem paths
		"hrsh7th/cmp-nvim-lsp", -- source for LSP
		"hrsh7th/cmp-nvim-lua", -- source for nvim lua
		{
			"L3MON4D3/LuaSnip",
			-- follow latest release
			version = "v2.3.0",
			-- install jsregexp
			build = "make install_jsregexp",
		},
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets
		"onsails/lspkind.nvim", -- vs-code like pictograms
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		-- Create a variable to track completion state
		vim.g.cmp_enabled = true

		-- Function to toggle completion
		local toggle_completion = function()
			vim.g.cmp_enabled = not vim.g.cmp_enabled
			if vim.g.cmp_enabled then
				cmp.setup.buffer({
					enabled = true,
				})
				print("Autocompletion enabled")
			else
				cmp.setup.buffer({
					enabled = false,
				})
				print("Autocompletion diabled")
			end
		end

		-- Keybinding for toggle cmp
		vim.keymap.set("n", "<leader>ta", toggle_completion, { desc = "Toggle autocompletion" })

		-- Loads vs-code style snippets from installed plugins (e.g. friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()
		cmp.setup({
			enabled = function()
				return vim.g.cmp_enabled
			end,
			performance = {
				debounce = 60,
				throttle = 30,
				fetching_timeout = 200,
				max_view_entries = 100,
			},
			completion = {
				keyword_length = 1, -- Start completion after 1 character
				completeopt = "menu,menuone,noselect",
			},
			preselect = cmp.PreselectMode.None, -- Don't preselect first item
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),
			-- sources for autocompletion
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- LSP
				{ name = "nvim_lua" }, -- nvim lua
				{ name = "luasnip" }, -- snippets
				{ name = "buffer" }, -- text within current buffer
				{ name = "path" }, -- filesystem paths
			}),
			-- Configure lspkind for vs-code like pictograms in completion menu
			formatting = {
				fields = { "kind", "abbr", "menu" },
				expandable_indicator = true,
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},
		})
	end,
}
