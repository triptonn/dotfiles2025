vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment / decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management (nvim)
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- tab management (nvim)
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- add empty line
keymap.set("n", "zk", "m`o<Esc>``", { desc = "Add empty line above cursor" })
keymap.set("n", "zj", "m`O<Esc>``", { desc = "Add empty line below cursor" })

keymap.set("n", "<F5>", "<cmd>:lua require('dap').continue()<CR>", { desc = "Start debugging / Continue" })
keymap.set("n", "<F10>", "<cmd>:lua require('dap').step_over()<CR>", { desc = "Step over" })
keymap.set("n", "<F11>", "<cmd>:lua require('dap').step_into()<CR>", { desc = "Step into" })
keymap.set("n", "<F12>", "<cmd>:lua require('dap').step_out()<CR>", { desc = "Step out" })

keymap.set("n", "<leader>b", "<cmd>:lua require('dap').toggle_breakpoint()<CR>", { desc = "Toggle breaktpoint" })
keymap.set("n", "<leader>B", "<cmd>:lua require('dap').set_breakpoint()<CR>", { desc = "Set breaktpoint" })
keymap.set(
	"n",
	"<leader>lp",
	"<cmd>:lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
	{ desc = "Toggle breaktpoint ()" }
)

keymap.set({ "n", "v" }, "<leader>ih", "<cmd>:lua require('dap.ui.widgets').hover()<CR>", { desc = "Debug hover info" })
keymap.set(
	"n",
	"<leader>if",
	"<cmd>:lua require('dap.ui.widgets').centered_float(widgets.frames)<CR>",
	{ desc = "Debug frames" }
)
keymap.set(
	"n",
	"<leader>is",
	"<cmd>:lua require('dap.ui.widgets').centered_float(widgets.scopes)<CR>",
	{ desc = "Debug scopes" }
)
