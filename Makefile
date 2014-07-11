CTAGS_URL=http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
CTAGS_PACKAGE=$(shell basename $(CTAGS_URL))
CTAGS_HOME=$(shell basename $(CTAGS_URL) .tar.gz)
CTAGS_INSTALLED ?= $(shell whereis -b ctags | cut -d' ' -f2)

VIMRC=.vimrc
FLUXBOX=.fluxbox

all: unpack installCtags updateFluxbox
	cp $(VIMRC) ~/$(VIMRC)
	@echo $(CTAGS_INSTALLED)
	git submodule update --init --recursive

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
	cd $(CTAGS_HOME) 
	./configure 
	sudo make install 
	@echo $(CTAGS_INSTALLED)
	touch $@

updateFluxbox:
	rm -rf ~/$(FLUXBOX)
	cp -r $(FLUXBOX) ~/$(FLUXBOX)

.PHONY: all unpack clean dist-clean
