if has("win32")
	source ~\AppData\local\nvim\plugins.vimrc
	source ~\AppData\local\nvim\general.vimrc
	source ~\AppData\local\nvim\keys.vimrc
	source ~\AppData\local\nvim\plugin_settings.vimrc
	source ~\AppData\local\nvim\functions.vimrc
else
	source ~/.config/nvim/plugins.vimrc
	source ~/.config/nvim/general.vimrc
	source ~/.config/nvim/keys.vimrc
	source ~/.config/nvim/plugin_settings.vimrc
	source ~/.config/nvim/functions.vimrc
endif

