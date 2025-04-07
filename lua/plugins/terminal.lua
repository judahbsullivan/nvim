-- Here is the Terminal Settings
return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				size = 20,
				open_mapping = [[<C-\\>]],
				hide_numbers = true,
				shade_terminals = true,
				shading_factor = 2,
				start_in_insert = true,
				persist_size = true,
				direction = "horizontal",
				close_on_exit = true,
				shell = "/usr/bin/zsh",
			})

			local terminals = {}

			local function toggle_terminal(id, direction)
				if not terminals[id] then
					terminals[id] = require("toggleterm.terminal").Terminal:new({
						id = id,
						direction = direction,
					})
				end
				terminals[id]:toggle()
			end

			local function new_split_terminal(direction)
				local id = #terminals + 1
				toggle_terminal(id, direction)
			end

			local function list_terminals()
				local lines = { "Active Terminals:" }
				for id, term in pairs(terminals) do
					if term:is_open() then
						table.insert(lines, string.format("Terminal %d: %s", id, term.direction))
					end
				end

				if #lines == 1 then
					print("No active terminals")
					return
				end

				local buf = vim.api.nvim_create_buf(false, true)
				vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
				local width, height = 40, #lines
				local opts = {
					relative = "editor",
					width = width,
					height = height,
					col = (vim.o.columns - width) / 2,
					row = (vim.o.lines - height) / 2,
					style = "minimal",
					border = "rounded",
				}
				vim.api.nvim_open_win(buf, true, opts)
			end

			local function close_all_terminals()
				for _, term in pairs(terminals) do
					term:close()
				end
				print("All terminals closed")
			end

			vim.keymap.set("n", "<C-\\>", ":ToggleTerm<CR>", { desc = "Toggle Terminal" })
			vim.keymap.set("n", "<leader>hh", function()
				toggle_terminal(1, "horizontal")
			end, { desc = "Toggle Terminal" })
			vim.keymap.set("n", "<leader>hf", function()
				toggle_terminal(2, "float")
			end, { desc = "Floating Terminal" })
			vim.keymap.set("n", "<leader>hl", list_terminals, { desc = "List Active Terminals" })
			vim.keymap.set("n", "<leader>hq", close_all_terminals, { desc = "Close All Terminals" })

			vim.keymap.set("n", "<leader>h|", function()
				new_split_terminal("horizontal")
			end, { desc = "New Horizontal Terminal Split" })

			vim.keymap.set("n", "<leader>h_", function()
				new_split_terminal("vertical")
			end, { desc = "New Vertical Terminal Split" })

			function _G.set_terminal_keymaps()
				local opts = { noremap = true }
				vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
				vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
			end

			vim.api.nvim_create_autocmd("TermOpen", {
				pattern = "term://*",
				callback = function()
					_G.set_terminal_keymaps()
				end,
			})
		end,
	},
}
