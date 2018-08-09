HOME_PATH = ~

all:
	@echo "Run a more specific task"

clean:
	@echo "Cleaning up existing configuration and software"
	rm -r /home/linuxbrew/
	rm -r $(HOME_PATH)/.tmux*
	rm -r $(HOME_PATH)/.aws
	rm -r $(HOME_PATH)/.config/nvim

install: install-linuxbrew install-configs install-brews

install-configs:
	@echo "Installing dot files..."
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

install-linuxbrew:
	@echo "Installing linuxbrew"
	sudo apt-get install -y build-essential curl file git
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
	echo 'export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"' >> ~/.profile
	echo 'export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"' >> ~/.profile
	echo 'export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"' >> ~/.profile

install-brews:
	@echo "Installing common Homebrew packages"
	brew install ag mycli neovim

# push-tick:
# 	@echo "Pushing TICK configuration"
# 	rsync $(RSYNC_PARAMS) --exclude-from=tick/.rsyncignore tick/ $(REMOTE_SERVER):$(HOME_PATH)/tick/

# pull-tick:
# 	@echo "Pulling TICK configuration updates from server"
# 	rsync $(RSYNC_PARAMS) --exclude-from=tick/.rsyncignore $(REMOTE_SERVER):$(HOME_PATH)/tick/ tick/

# sync-tick: pull-tick push-tick

# push-unifi:
# 	@echo "Pushing Unifi configuration"
# 	rsync $(RSYNC_PARAMS) unifi/ $(REMOTE_SERVER):$(HOME_PATH)/unifi/

# pull-unifi:
# 	@echo "Pulling Unifi configuration"
# 	rsync $(RSYNC_PARAMS) --exclude-from=unifi/.rsyncignore $(REMOTE_SERVER):$(HOME_PATH)/unifi/ unifi/

# sync-unifi: pull-unifi push-unifi
