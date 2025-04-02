-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Makes Colorschemes transparent
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.cmd([[
      highlight Normal guibg=none ctermbg=none
      highlight NormalFloat guibg=none ctermbg=none
      highlight NeoTreeNormal guibg=none ctermbg=none
      highlight NeoTreeNormalNC guibg=none ctermbg=none
    ]])
  end,
})
