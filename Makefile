CTAGS_URL=http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
CTAGS_PACKAGE=$(shell basename $(CTAGS_URL))
CTAGS_HOME=$(shell basename $(CTAGS_URL) .tar.gz)
CTAGS_INSTALLED ?= $(shell whereis -b ctags | cut -d ' ' -f2)

VIMRC=.vimrc
TmuxConf=.tmux.conf

all: unpack installCtags clear-ctags
	cp $(VIMRC) ~/$(VIMRC)
	sudo apt-get install tmux -y
	cp $(TmuxConf) ~/$(TmuxConf)
	@echo $(CTAGS_INSTALLED)
	git submodule update --init --recursive
	git submodule foreach 'git checkout master; git pull'

dist-clear:
	$(clear)
	rm -r installCtags unpack

clear-ctags:
	@echo "CTAGS_HOME: " $(CTAGS_HOME)
	rm -rf $(CTAGS_PACKAGE) $(CTAGS_HOME)

clear: clear-ctags
	rm -vf ~/$(VIMRC)

$(CTAGS_PACKAGE):
	wget -c $(CTAGS_URL) 

unpack: $(CTAGS_PACKAGE) 
	tar -zxvf $(CTAGS_PACKAGE)
	touch $@

installCtags: $(unpack)
	cd $(CTAGS_HOME); ./configure; sudo make install;
	@echo $(CTAGS_INSTALLED)
	touch $@

.PHONY: all
