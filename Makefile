CTAGS_URL=http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
CTAGS_PACKAGE=$(shell basename $(CTAGS_URL))
CTAGS_HOME=$(shell basename $(CTAGS_URL) .tar.gz)
CTAGS_INSTALLED ?= $(shell whereis -b ctags | cut -d' ' -f2)

VIMRC=.vimrc

all: unpack installCtags
	cp $(VIMRC) ~/$(VIMRC)
	@echo $(CTAGS_INSTALLED)
	git submodule init
	git submodule update

dist-clean:
	$(clean)
	rm -r installCtags unpack

clean:
	rm -vf ~/$(VIMRC)
	rm -rf $(CTAGS_PACKAGE) $(CTAGS_HOME)

$(CTAGS_PACKAGE):
	wget -c $(CTAGS_URL) 

unpack: $(CTAGS_PACKAGE) 
	tar -zxvf $(CTAGS_PACKAGE)
	touch $@

installCtags: $(unpack)
	cd $(CTAGS_HOME) && ./configure && $(MAKE) && sudo $(MAKE) install && $(MAKE) clean
	@echo $(CTAGS_INSTALLED)
	touch $@

.PHONY: all unpack clean dist-clean
