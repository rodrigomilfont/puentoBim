MXMLC=./

VIMRC=.vimrc

.PHONY: all vimrc clean

all: vimrc
	cp $(VIMRC) ~/$(VIMRC)

clean:
	rm -vf ~/$(VIMRC)

