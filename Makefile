HOME_PATH = ~

all:
	@echo "Run a more specific task"

clean:
	@echo "Cleaning up existing configuration and software"
	rm -rf /home/linuxbrew/
	rm -rf $(HOME_PATH)/.tmux*
	rm -rf $(HOME_PATH)/.aws
	rm -rf $(HOME_PATH)/.config/nvim
	rm -rf $(HOME_PATH)/.local/share/nvim/site/autoload/plug.vim

install: install-linuxbrew install-configs install-brews

install-configs:
	@echo "Installing dot files..."
	# Bash
	cp bash_profile $(HOME_PATH)/.bash_profile
	# Git
	cp gitconfig $(HOME_PATH)/.gitconfig
	# Tmux config and plugins
	cp tmux.conf $(HOME_PATH)/.tmux.conf
	mkdir -p $(HOME_PATH)/.tmux/plugins
	git clone https://github.com/tmux-plugins/tpm $(HOME_PATH)/.tmux/plugins/tpm
	# AWS
	mkdir -p $(HOME_PATH)/.aws
	cp aws.conf $(HOME_PATH)/.aws/config
	touch $(HOME_PATH)/.aws/credentials
	# Neovim
	mkdir -p $(HOME_PATH)/.config/nvim
	cp nvim/init.vim $(HOME_PATH)/.config/nvim
	# Neovim vim-plug
	curl -fLo $(HOME_PATH)/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	mkdir -p $(HOME_PATH)/.local/share/nvim/backup
	mkdir -p $(HOME_PATH)/.local/share/nvim/swap
	mkdir -p $(HOME_PATH)/.local/share/nvim/undo

install-linuxbrew:
	@echo "Installing linuxbrew"
	sudo apt-get install -y build-essential curl file git
	sh -c "$$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

install-brews:
	@echo "Installing common Homebrew packages"
	brew install ag mycli neovim bash-completion bash-git-prompt
