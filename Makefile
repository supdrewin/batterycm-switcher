PREFIX=/usr
.PHONY: install uninstall clean

all:
	mkdir -p build/lib
	mkdir build/man
	xz -c src/lib/adjuster.lib.in >build/lib/adjuster.lib
	xz -c src/lib/debugger.lib.in >build/lib/debugger.lib
	xz -c src/lib/keymapper.lib.in >build/lib/keymapper.lib
	xz -c src/lib/main.sh >build/lib/batterycm-switcher
	gzip -c src/man/batterycm-switcher.1 >build/man/batterycm-switcher.1.gz

install:
	install -Dm644 build/lib/adjuster.lib build/lib/debugger.lib build/lib/keymapper.lib -t $(DESTDIR)$(PREFIX)/lib/batterycm-switcher
	install -Dm644 build/lib/batterycm-switcher -t $(DESTDIR)$(PREFIX)/lib/batterycm-switcher
	install -Dm644 build/man/batterycm-switcher.1.gz -t $(DESTDIR)$(PREFIX)/share/man/man1
	install -Dm644 LICENSE -t $(DESTDIR)$(PREFIX)/share/licenses/batterycm-switcher
	install -Dm644 src/desktop/org.freedesktop.batterycm-switcher.desktop.in $(DESTDIR)$(PREFIX)/share/applications/org.freedesktop.batterycm-switcher.desktop
	install -Dm644 src/etc/default.conf.in $(DESTDIR)/etc/batterycm-switcher/batterycm.conf
	install -Dm644 src/etc/vimrc.in $(DESTDIR)/etc/batterycm-switcher/vimrc
	install -Dm644 src/polkit/org.freedesktop.batterycm-switcher.policy.in $(DESTDIR)$(PREFIX)/share/polkit-1/actions/org.freedesktop.batterycm-switcher.policy
	install -Dm644 src/service/batterycm-switcher.service.in $(DESTDIR)$(PREFIX)/lib/systemd/system/batterycm-switcher.service
	install -Dm755 src/bin/batterycm-switcher.in $(DESTDIR)$(PREFIX)/bin/batterycm-switcher

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/batterycm-switcher
	rm -f $(DESTDIR)$(PREFIX)/lib/systemd/system/batterycm-switcher.service
	rm -f $(DESTDIR)$(PREFIX)/share/applications/org.freedesktop.batterycm-switcher.desktop
	rm -f $(DESTDIR)$(PREFIX)/share/man/man1/batterycm-switcher.1.gz
	rm -f $(DESTDIR)$(PREFIX)/share/polkit-1/actions/org.freedesktop.batterycm-switcher.policy
	rm -rf $(DESTDIR)$(PREFIX)/lib/batterycm-switcher
	rm -rf $(DESTDIR)$(PREFIX)/share/licenses/batterycm-switcher
	rm -rf $(DESTDIR)/etc/batterycm-switcher

clean:
	rm -rf build
