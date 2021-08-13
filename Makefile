# \ var
# detect module/project name by current directory
MODULE  = $(notdir $(CURDIR))
# detect OS name (only Linux in view)
OS      = $(shell uname -s)
# current date in the `ddmmyy` format
NOW     = $(shell date +%d%m%y)
# release hash: four hex digits (for snapshots)
REL     = $(shell git rev-parse --short=4 HEAD)
# / var

# \ dir
# current (project) directory
CWD     = $(CURDIR)
# source code (not for all languages, Rust/C included)
SRC     = $(CWD)/sources
# temporary/generated files
TMP     = $(CWD)/tmp
CLS     = $(CWD)/classes
RES     = $(CWD)/res
# / dir

# \ tool
# http/ftp download tool
CURL    = curl -L -o
JAVA    = $(shell which java) -cp bin
JAVAC   = $(shell which javac)
ANTLR   = $(shell which antlr4)
# / tool

# \ cfg
# JFLAGS += -source 8 -target 1.8
JFLAGS += -d bin
# / cfg

# \ src
J += $(shell find src -type f -regex ".+.java$$")
S += $(J)
# / src

CLASS = $(shell echo $(J) | sed "s/src/bin/g" | sed "s/\.java/\.class/g")

###############################################################################

all: $(CLASS)

bin/%.class: src/%.java
	$(JAVAC) $(JFLAGS) $^

MAIN = Example1
test: $(CLASS)
	$(JAVA) $(MAIN) $(shell ls)

###############################################################################

.PHONY: install $(OS)_install
install: $(OS)_install
$(OS)_install:
	sudo apt update
	sudo apt install -u `cat apt.txt`

MERGE  = Makefile README.md apt.txt .gitignore $(S) .vimrc
MERGE += bin tmp $(SRC) $(CLS) $(RES)

.PHONY: dev
dev:
	git checkout $@
	git checkout ponymuck -- $(MERGE)

.PHONY: ponymuck
ponymuck:
	git push -v
	git checkout $@

.PHONY: release
release:
	git tag $(NOW)-$(REL)
	git push -v && git push -v --tags
	$(MAKE) ponymuck

.PHONY: zip
zip:
	git archive \
		--format zip \
		--output $(TMP)/$(MODULE)_$(NOW)_$(REL).src.zip \
	HEAD
