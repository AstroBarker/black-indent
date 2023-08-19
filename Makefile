PREFIX = /usr
MANDIR = $(PREFIX)/share/man

all:
	@echo Run \'make install\' to install black-indent.

install:
	@mkdir -p $(DESTDIR)$(PREFIX)/bin
	@mkdir -p $(DESTDIR)$(MANDIR)/man1
	@cp -p black-indent.sh $(DESTDIR)$(PREFIX)/bin/black-indent
	@cp -p black-indent.1 $(DESTDIR)$(MANDIR)/man1
	@chmod 755 $(DESTDIR)$(PREFIX)/bin/black-indent

uninstall:
	@rm -rf $(DESTDIR)$(PREFIX)/bin/black-indent
	@rm -rf $(DESTDIR)$(MANDIR)/man1/black-indent.1*
