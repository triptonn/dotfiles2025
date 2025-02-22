return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		preset = "helix",

		delay = function(ctx)
			return ctx.plugin and 0 or 200
		end,

		--[[ filter = function(mapping)
			return true
		end, ]]

		spec = {},
		notify = true,

		defer = function(ctx)
			return ctx.mode == "V" or ctx.mode == "<C-V>"
		end,

		plugins = {
			marks = true, -- shows a list of your marks on ' and `
			registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
			spelling = {
				enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
				suggestions = 10, -- how many suggestions should be shown in the list?
			},
			presets = {
				operators = true, -- adds help for operators like d, y, ...
				motions = true, -- adds help for motions
				text_objects = true, -- help for text objects triggered after entering an operator
				windows = true, -- default bindings on <c-w>
				nav = true, -- misc bindings to work with windows
				z = true, -- bindings for folds, spelling and others prefixed with z
				g = true, -- bindings for prefixed with g
			},
		},

		--[[ window = {
			border = "single",
			position = "bottom",
			--no_overlap = true,
			--style = {},
			--relative = "cursor",
			--focusable = false,
			--noautocmd = false,
			padding = { 1, 1 }, -- extra window padding [top/bottom, right/left]
			winblend = 0, -- removed transparency
			--title = true,
			--title_pos = "center",
			--zindex = 1000,
		}, ]]

		popup = {
			border = "single",
			position = "bottom",
			padding = { 1, 1 },
			winblend = 0,
		},

		layout = {
			height = { min = 3, max = 15 }, -- Limited max height
			width = { min = 20, max = 50 }, -- min and max width of the columns
			spacing = 2, -- spacing between columns
			align = "center",
		},

		keys = {
			scroll_down = "<c-d>", -- binding to scroll down inside the popup
			scroll_up = "<c-u>", -- binding to scroll up inside the popup
		},

		expand = 0, -- expand groups when <= n mappings

		replace = {
			key = {
				function(key)
					return require("which-key.view").format(key)
				end,
			},
			desc = {
				{ "<Plug>%(?(.*)%)?", "%1" },
				{ "^%+", "" },
				{ "<[cC]md>", "" },
				{ "<[cC][rR]>", "" },
				{ "<[sS]ilent>", "" },
				{ "^lua%s+", "" },
				{ "^call%s+", "" },
				{ "^:%s*", "" },
			},
		},
		--[[ icons = {
			breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
			separator = "➜", -- symbol used between a key and it's label
			group = "+", -- symbol prepended to a group
			ellipsis = "…",
			mappings = true,
			rules = {},
			colors = true,
			keys = {
				Up = " ",
				Down = " ",
				Left = " ",
				Right = " ",
				C = "󰘴 ",
				M = "󰘵 ",
				D = "󰘳 ",
				S = "󰘶 ",
				CR = "󰌑 ",
				Esc = "󱊷 ",
				ScrollWheelDown = "󱕐 ",
				ScrollWheelUp = "󱕑 ",
				NL = "󰌑 ",
				BS = "󰁮",
				Space = "󱁐 ",
				Tab = "󰌒 ",
				F1 = "󱊫",
				F2 = "󱊬",
				F3 = "󱊭",
				F4 = "󱊮",
				F5 = "󱊯",
				F6 = "󱊰",
				F7 = "󱊱",
				F8 = "󱊲",
				F9 = "󱊳",
				F10 = "󱊴",
				F11 = "󱊵",
				F12 = "󱊶",
			},
		}, ]]

		--[[ triggers = {
			{ "<auto>", mode = "nxso" },
		}, ]]

		triggers = {
			{ mode = "n", "<leader>" },
			{ mode = "x", "<leader>" },
			{ mode = "v", "<leader>" },
			{ mode = { "n", "x", "v" }, "g" },
			{ mode = { "n", "x", "v" }, "z" },
			{ mode = "n", "]" },
			{ mode = "n", "[" },
		},

		-- sort = { "local", "order", "group", "alphanum", "mod" },
		sort = { "local", "group" },

		show_help = false, -- show a help message in the command line for using WhichKey
		show_keys = false, -- show the currently pressed key and its label as a message in the command line

		disable = {
			ft = {
				"TelescopePrompt",
				"lazy",
				"mason",
			},
			bt = {
				"quickfix",
				"prompt",
				"nofile",
			},
		},

		debug = false, -- enable wk.log in the current directory
	},
}
