NAME = fzf-open
VERSION = 0.3
ARCHIVE = $(NAME)-$(VERSION).tar.gz

all:
	make release
	make aur_package

release:
	mkdir -p release
	mkdir -p pkg
	cp extra/config fzf-open/* -t release
	tar czf pkg/$(ARCHIVE) -C release .
	rm -r release

aur_package:
	cp extra/PKGBUILD.proto pkg/PKGBUILD
	$(eval SHA256SUMS := $(shell sha256sum pkg/$(ARCHIVE) | sed 's/ .*//'))
	sed -i 's/__SHA256SUMS__/$(SHA256SUMS)/' pkg/PKGBUILD
	sed -i 's/__PKGVER__/$(VERSION)/' pkg/PKGBUILD

clean:
	rm -rf pkg
