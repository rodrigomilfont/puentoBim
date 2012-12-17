CTAGS_URL=http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
CTAGS_PACKAGE=$(shell basename $(CTAGS_URL))
CTAGS_HOME=$(shell basename $(CTAGS_URL) .tar.gz)
installCtags ?= 'which ctags'


VIMRC=.vimrc


all: $(CTAGS_PACKAGE) $(installCtags) vimrc
	cp $(VIMRC) ~/$(VIMRC)

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

$(installCtags): unpack
	cd $(CTAGS_HOME) && ./configure && $(MAKE) && sudo $(MAKE) install && $(MAKE) clean
	@echo $(installCtags)
	touch $@

.PHONY: all vimrc clean dist-clean
