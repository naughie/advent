TEX = latexmk
TARDIR = ./.target
TARGET = $(TARDIR)/note.pdf
SOURCE = ./note.tex
TEXFLAGS = -lualatex -outdir=$(TARDIR)
STYLES = $(wildcard $(TEXMFLOCAL)/tex/latex/naughie/*)
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
MONITCMD = $(MONIT) $(MONITFLAGS) $(realpath $(SOURCE)) $(realpath $(STYLES))
OPEN = open

$(TARGET): $(SOURCE) $(STYLES)
	$(TEX) $(TEXFLAGS) $(SOURCE) >/dev/null 2>&1

init:
	mkdir -p ./$(d)
	cp ./makefile ./$(d)
	touch ./$(d)/note.tex ./$(d)/biblio.bib

git:
	$(GIT) $(GITADD) && \
	$(GIT) $(GITCOM)

clean:
	$(TEX) -c $(TEXFLAGS) $(SOURCE)

rm:
	-rm -rf $(TARDIR)

all: rm $(TARGET)

monitor:
	$(MONITCMD) | \
	$(XARGS) $(XAGFLAGS) make -C $(PWD) -s 2>&1 | \
	$(XARGS) -I {} terminal-notifier -message "{}" &

kill:
	ps -ef | grep "$(MONITCMD)" | grep -v grep | awk '{print $$2}' | tr '\n' ' ' | $(XARGS) -I {} kill -$(MONITSIG) {}

cp:
	echo $(notdir $(patsubst %/$(patsubst ./%,%,$(TARGET)),%,$(shell find . -type f -name $(notdir $(TARGET))))) | tr ' ' '\n' | $(XARGS) -I {} cp {}/$(TARGET) $(d)/{}.pdf

open:
	$(OPEN) $(TARGET)
