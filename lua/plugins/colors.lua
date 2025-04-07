return {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = true,
		opts = {
			transparent_mode = true,
		},
	},
	{
		"norcalli/nvim-colorizer.lua",
		version = "*",
		config = function()
			-- Attaches to every FileType mode
			require("colorizer").setup()

			-- Attach to certain Filetypes, add special configuration for `html`
			-- Use `background` for everything else.
			require("colorizer").setup({
				"css",
				"javascript",
				html = {
					mode = "foreground",
				},
			})

			-- Use the `default_options` as the second parameter, which uses
			-- `foreground` for every mode. This is the inverse of the previous setup configuration.
			require("colorizer").setup({
				"css",
				"javascript",
				html = { mode = "background" },
			}, { mode = "foreground" })

			-- Highlight all files, but customize some others.
			require("colorizer").setup({
				"*",
				css = { rgb_fn = true }, -- Enable parsing rgb(...) functions in css.
				html = { names = false }, -- Disable parsing "names" like Blue or Gray
			})

			-- Exclude some filetypes from highlighting by using `!`
			require("colorizer").setup({
				"*", -- Highlight all files, but customize some others.
				"!vim", -- Exclude vim from highlighting.
			})
		end,
	},
	{
		"roobert/tailwindcss-colorizer-cmp.nvim",
		-- optionally, override the default options:
		config = function()
			require("tailwindcss-colorizer-cmp").setup({
				color_square_width = 2,
			})
		end,
	},
}
