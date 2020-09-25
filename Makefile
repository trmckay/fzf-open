NAME = fzf-open
VERSION = 0.2
ARCHIVE = $(NAME)-$(VERSION).tar.gz

release:
	mkdir -p release
	cp lopen.sh fzf-open.sh example_config -t release
	tar czf $(ARCHIVE) -C release .
	rm -r release
	cp PKGBUILD.proto PKGBUILD
	$(eval SHA256SUMS := $(shell sha256sum $(ARCHIVE) | sed 's/ .*//'))
	sed -i 's/__SHA256SUMS__/$(SHA256SUMS)/' PKGBUILD
	sed -i 's/__PKGVER__/$(VERSION)/' PKGBUILD

clean:
	rm $(ARCHIVE)
	rm PKGBUILD
