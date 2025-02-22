vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 4 -- 2 spaces for indents width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- Copy indent from current line when starting new one

opt.wrap = false

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- If you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes" -- Show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- Allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- Use system clipboard as default register

-- split windows
opt.splitright = true -- Split vertical window to the right
opt.splitbelow = true -- Split horizontal window to the bottom

-- vim.g.lazyvim_python_lsp = "pyright"
-- vim.g.lazyvim_python_ruff = "ruff"
vim.g.lazyvim_python_lsp = "python-language-server"

-- Add these performance-related options
opt.updatetime = 250 -- Faster completion (default is 4000ms)
opt.timeoutlen = 300 -- Faster key sequence completion (default is 1000ms)
opt.redrawtime = 1500 -- Allow more time for loading syntax on large files
opt.lazyredraw = true -- Don't redraw screen while executing macros
opt.hidden = true -- Enable background buffers
opt.history = 100 -- Limit history
opt.synmaxcol = 240 -- Max column for syntax highlight
opt.ttyfast = true -- Faster terminal connection

-- If you're experiencing performance issues with large files, add:
-- opt.maxmempattern = 2000 -- Increase memory limit for pattern matching
