HOME_PATH = ~

all:
	@echo "Run a more specific task"

install:
	@echo "Installing dot files..."
	# Tmux config and plugins
	cp tmux.conf $(HOME_PATH)/.tmux.conf
	mkdir -p $(HOME_PATH)/.tmux/plugins
	git clone https://github.com/tmux-plugins/tpm $(HOME_PATH)/.tmux/plugins/tpm
	tmux source $(HOME_PATH)/.tmux.conf
	# AWS
	mkdir -p $(HOME_PATH)/.aws
	cp aws.conf $(HOME_PATH)/.aws/config
	touch $(HOME_PATH)/.aws/credentials
	# Nvim
	mkdir -p $(HOME_PATH)/.config/nvim
	cp nvim/init.vim $(HOME_PATH)/.config/nvim

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
