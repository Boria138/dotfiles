local g = vim.g
local o = vim.opt
local cmd = vim.cmd


cmd[[
  syntax enable
  filetype plugin indent on
]]

-- General
g.mapleader = ' '
o.encoding = 'utf-8'
o.fileencoding = 'utf-8'
o.swapfile = false
o.wrap = true
o.number = true
o.clipboard = 'unnamedplus'
o.mouse = 'a'
o.hidden = true
o.showmode = false
o.wildmenu = true
o.termguicolors = true

-- Indentation
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
expandtab = true
smarttab = true
autoindent = true
o.backspace = 'indent,eol,start'

-- Cursor
o.guicursor = 'n-v-c-sm:hor20,i-ci-ve:ver25,r-cr-o:hor20'
o.cursorline = true

-- List
o.list = true
o.listchars = {
  tab = '│·',
  extends = '⟩',
  precedes = '⟨',
  trail = '·'
}

-- Search
o.ignorecase = true
o.smartcase = true
