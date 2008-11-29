all:
	for i in *.po ; do mkdir -p ../locale/`basename $$i .po`/LC_MESSAGES ; msgfmt -o ../locale/`basename $$i .po`/LC_MESSAGES/pastebin.mo $$i ; done

merge:
	for i in *.po ; do msgmerge -U $$i messages.pot ; done

update:
	xgettext -n -o messages.pot ../*.php

clean:
	rm -f *~ *.mo
