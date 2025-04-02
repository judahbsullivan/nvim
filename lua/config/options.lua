local opts = vim.g

opts.mapleader = " "
opts.maplocalleader = "\\"

opts.lazyvim_check_order = false

opts.ai_cmp = true

opts.termguicolors = true
opts.trouble_lualine = true
opts.autowrite = true -- Enable auto write
-- only set clipboard if not in ssh, to make sure the OSC 52
-- integration works automatically. Requires Neovim >= 0.10.0
opts.completeopt = "menu,menuone,noselect"
opts.confirm = true -- Confirm to save changes before exiting modified buffer
opts.cursorline = true -- Enable highlighting of the current line
opts.expandtab = true -- Use spaces instead of tabs
opts.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

if vim.fn.has("nvim-0.10") == 1 then
  opts.smoothscroll = true
  opts.foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()"
  opts.foldmethod = "expr"
  opts.foldtext = ""
else
  opts.foldmethod = "indent"
  opts.foldtext = "v:lua.require'lazyvim.util'.ui.foldtext()"
end

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
