if vim.loader then
	vim.loader.enable()
end
vim.print = _G.dd
require("config.lazy")
