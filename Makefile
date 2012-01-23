CTAGS_URL=http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
CTAGS_PACKAGE=$(shell basename $(CTAGS_URL))
CTAGS_HOME=$(shell basename $(CTAGS_URL) .tar.gz)
installCtags=installCtags


VIMRC=.vimrc

.PHONY: all vimrc clean

all: $(CTAGS_PACKAGE) $(installCtags) vimrc
	cp $(VIMRC) ~/$(VIMRC)

clean:
	rm -vf ~/$(VIMRC)
	rm -rf $(CTAGS_PACKAGE) $(CTAGS_HOME)

$(CTAGS_PACKAGE):
	wget -c $(CTAGS_URL) 

unpack: $(CTAGS_PACKAGE) $(installCtags)
	tar -zxvf $(CTAGS_PACKAGE)

$(installCtags): unpack
	#cd $(CTAGS_HOME) && ./configure && $(MAKE) && sudo $(MAKE) install && $(MAKE) clean
	@echo $(installCtags)
	touch $@
