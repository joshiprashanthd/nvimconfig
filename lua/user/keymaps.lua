local opts = { noremap = true, silent = true}

local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

-- Remap comma as leader key
keymap("", ",", "<Nop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Window Navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize windows
keymap("n", "<C-Up>", "<cmd>resize -2", opts)
keymap("n", "<C-Down>", "<cmd>resize +2", opts)
keymap("n", "<C-Left>", "<cmd>vertical resize -2", opts)
keymap("n", "<C-Right>", "<cmd>vertical resize +2", opts)

-- Navigate Buffers
keymap("n", "gt", "<cmd>bnext<CR>", opts)
keymap("n", "gT", "<cmd>bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc><cmd>m .+1<CR>", opts)
keymap("n", "<A-k>", "<Esc><cmd>m .-2<CR>", opts)

-- General
keymap("i", "jk", "<Esc>", opts)
keymap("i", "<leader>u", "<Esc>viw~ei", opts)
keymap("n", "<leader>w", "<Esc><cmd>w<CR>", opts)
keymap("n", "<C-h>", "<C-w>w", opts)
keymap("n", "<C-i>", "<C-w> +2", opts)
keymap("n", "<C-d>", "<C-w> -2", opts)

-- NvimTree
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)
keymap("n", "<leader>o", "<cmd>NvimTreeFocus<CR>", opts)
keymap("n", "<leader>rl", "<cmd>NvimTreeResize -2<CR>", opts)
keymap("n", "<leader>rr", "<cmd>NvimTreeResize +2<CR>", opts)

-- Bufferline
keymap("n", "gt", "<cmd>BufferLineCycleNext<CR>", opts)
keymap("n", "gT", "<cmd>BufferLineCyclePrev<CR>", opts)
keymap("n", "<leader>pc", "<cmd>BufferLinePickClose<CR>", opts)
keymap("n", "<leader>pk", "<cmd>BufferLinePick<CR>", opts)
keymap("n", "<leader>pr", "<cmd>BufferLineCloseRight<CR>", opts)

-- Telescope
keymap("n", "<leader>f", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader>g", "<cmd>Telescope live_grep<CR>", opts)

-- ToggleTerm
keymap("n", "tt", "<cmd>ToggleTerm<CR>", opts)
