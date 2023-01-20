local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- Control-S Save
map("n", "<C-s>", ":w<CR>", default_opts)
map("v", "<C-s>", "<esc>:w<CR>", default_opts)
map("i", "<C-s>", "<esc>:w<CR>", default_opts)

-- Control-Z Undo
map("n", "<C-z>", ":u<CR>", default_opts)
map("v", "<C-z>", "<esc>:u<CR>", default_opts)
map("i", "<C-z>", "<esc>:u<CR>", default_opts)

-- Control-Q exit
map("n", "<C-q>", ":q<CR>", default_opts)
map("v", "<C-q>", "<esc>:q<CR>", default_opts)
map("i", "<C-q>", "<esc>:q<CR>", default_opts)

-- Control-Shift-Q force exit
map("n", "<C-S-q>", ":q!<CR>", default_opts)
map("v", "<C-S-q>", "<esc>:q!<CR>", default_opts)
map("i", "<C-S-q>", "<esc>:q!<CR>", default_opts)

-- Control-C Copy in visual mode
map("v", "<C-C>", "y", {})

-- Control-V Paste in insert and command mode
map("i", "<C-v>", "<esc>pa", {})
map("c", "<C-v>", "<C-r>0", {})

-- Filemanager
map("n", "<C-n>", ":Telescope file_browser<CR>", default_opts)

-- Bars
map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", default_opts)
map("n", "<A-.>", "<Cmd>BufferNext<CR>", default_opts)

map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", default_opts)
map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", default_opts)
map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", default_opts)
map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", default_opts)
map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", default_opts)
map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", default_opts)
map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", default_opts)
map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", default_opts)
map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", default_opts)
map("n", "<A-0>", "<Cmd>BufferLast<CR>", default_opts)
