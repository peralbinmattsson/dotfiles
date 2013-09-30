#!/bin/bash                                                                     
                                                                                
echo "Installing..."                                                            
                                                                                
# Do vundle install, should be handled from within vimrc
vim +q                                             
																										  
# Make xmledit autocomplete jinja files
if [ -f ~/.vim/bundle/xmledit/ftplugin/jinja.vim ]
then
  echo "jinja.vim symlink already exists"
else
  ln -s ~/.vim/bundle/xmledit/ftplugin/html.vim ~/.vim/bundle/xmledit/ftplugin/jinja.vim
fi

if [ ! -f ~/.vim/bundle/command-t/ruby/command-t/ext.so ]
then
	cd ~/.vim/bundle/command-t/ruby/command-t
	ruby extconf.rb
	make
fi
																										  
echo "Done." 
