install: install-vim install-bash install-bash install-tmux done

PWD_INIT=${PWD}

install-vim:
	rm -rf ~/.vim ~/.vimrc
	ln -s ${PWD_INIT}/vim ~/.vim
	ln -s ~/.vim/vimrc ~/.vimrc

install-bash:
	rm -f ~/.bashrc
	ln -s ${PWD_INIT}/bashrc ~/.bashrc

install-git:
	rm -f ~/.gitconfig
	ln -s ${PWD_INIT}/gitconfig ~/.gitconfig

install-tmux:
	rm -f ~/.tmux.conf
	ln -s ${PWD_INIT}/tmux ~/.tmux.conf

done:
	echo "Done"
