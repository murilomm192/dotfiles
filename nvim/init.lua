-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

if vim.g.neovide then
    	vim.o.guifont = "FiraCode Nerd Font:h9"

    	vim.g.neovide_padding_top = 0
	vim.g.neovide_padding_bottom = 0
	vim.g.neovide_padding_right = 0
	vim.g.neovide_padding_left = 0

	vim.g.transparency = 1
	vim.g.neovide_transparency = 1

	vim.g.neovide_hide_mouse_when_typing = true

	vim.g.neovide_fullscreen = true

	vim.g.neovide_remember_window_size = true


end