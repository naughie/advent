MD = pandoc
COMMONMDFLAGS = -f markdown -t html5 --mathjax
TARDIR = ./.target
SOURCE = $(wildcard ./*.md)
MDVARS = -V author-meta=Naughie -V date-meta="12/22" -V title-prefix="Naughie's Notes"
MDFLAGS = $(COMMONMDFLAGS) --template=naughie --css=preload.css --include-before-body=$(TARDIR)/headers.html $(MDVARS) -o $(patsubst %.md,$(TARDIR)/%.html,$(s))
HEADERS = ./headers.md
HEADERSOUT = $(patsubst %.md,$(TARDIR)/%.html,$(HEADERS))
HEADERFLAGS = $(COMMONMDFLAGS) -o $(HEADERSOUT)
MESSAGE = "Snapshot at `date -R`"
GIT = git
GITADD = add -A
GITCOM = commit -m $(MESSAGE)
MONIT = fswatch
MONITFLAGS = -0 -l 3 -L
MONITSIG = INT
XARGS = xargs
XAGFLAGS = -0 -n 1 -I {}
TARGETS = $(wildcard */$(TARGET))
MONITCMD = $(MONIT) $(MONITFLAGS) $(realpath $(SOURCE))
OPEN = open

md:
	$(MD) $(MDFLAGS) $(s)

headers:
	$(MD) $(HEADERFLAGS) $(HEADERS)

git:
	$(GIT) $(GITADD) && \
	$(GIT) $(GITCOM)

clean:
	$(TEX) -c $(TEXFLAGS) $(SOURCE)

monitor:
	$(MONITCMD) | \
	$(XARGS) $(XAGFLAGS) make -C $(PWD) -s 2>&1 | \
	$(XARGS) -I {} terminal-notifier -message "{}" &

kill:
	ps -ef | grep "$(MONITCMD)" | grep -v grep | awk '{print $$2}' | tr '\n' ' ' | $(XARGS) -I {} kill -$(MONITSIG) {}

open:
	$(OPEN) $(patsubst %.md,$(TARDIR)/%.html,$(s))
