MD2HTML = pandoc
MD2HTMLFLAGS = -f markdown -t html5 --template=naughie --mathjax
TARDIR = ./.target
TARGET = $(TARDIR)/note.html
SOURCE = ./note.md
MESSAGE = "Snapshot at `date -R`"
GIT = git
GITADD = add -A
GITCOM = commit -m $(MESSAGE)
MONIT = fswatch
MONITFLAGS = -0 -l 1 -L
MONITSIG = INT
XARGS = xargs
XAGFLAGS = -0 -n 1 -I {}
TARGETS = $(wildcard */$(TARGET))
MONITCMD = $(MONIT) $(MONITFLAGS) $(realpath $(SOURCE)) $(realpath $(STYLES))
OPEN = open

$(TARGET): $(SOURCE)
	$(MD2HTML) $(MD2HTMLFLAGS) $(SOURCE) >$(TARGET) 2>/dev/null

init:
	mkdir -p ./$(d)
	cp ./makefile ./$(d)
	touch ./$(d)/note.tex ./$(d)/biblio.bib

git:
	$(GIT) $(GITADD) && \
	$(GIT) $(GITCOM)

clean:
	-rm $(TARGET)

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
