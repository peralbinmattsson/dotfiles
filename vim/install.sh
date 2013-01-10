#!/bin/bash                                                                     
                                                                                
echo "Installing..."                                                            
                                                                                
# Do vundle install, should be handled from within vimrc
vim +q                                             
																										  
# Make xmledit also autocomplete html files
if [ -f ~/.vim/bundle/xmledit/ftplugin/html.vim ]
then
  echo "html.vim symlink already exists"
else
  ln -s ~/.vim/bundle/xmledit/ftplugin/xml.vim ~/.vim/bundle/xmledit/ftplugin/html.vim
fi

if [ ! -f ~/.vim/bundle/command-t/ruby/command-t/ext.so ]
then
	cd ~/.vim/bundle/command-t/ruby/command-t
	ruby extconf.rb
	make
fi
																										  
echo "Done." 
