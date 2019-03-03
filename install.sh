# read this file carefuly, then, run the command:
# chmod +x install.sh, same for the uninstall.sh
cd

# creating the backup folder for the original ones
mkdir dotfiles_backup
mv .vimrc dotfiles_backup
mv .vimrc.plugins dotfiles_backup
mv .tmux.conf dotfiles_backup
mv .tmux.conf.local dotfiles_backup

# just adding a source to the files at HOME, to redirect to the dotfile configuration
echo 'source ~/dotfiles/vim/.vimrc' >> .vimrc
echo 'source ~/dotfiles/vim/.vimrc.plugins' >> .vimrc.plugins
echo 'source ~/dotfiles/tmux/.tmux.conf' >> .tmux.conf
echo 'source ~/dotfiles/tmux/.tmux.conf.local' >> tmux.conf.local