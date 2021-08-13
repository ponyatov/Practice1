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
BLD     = $(CWD)/build
# / dir

# \ tool
# http/ftp download tool
CURL    = curl -L -o
JAVA    = $(shell which java) -cp $(CLS)
JAVAC   = $(shell which javac)
JAR     = $(shell which jar)
ANTLR   = $(shell which antlr4)
# / tool

# \ cfg
# JFLAGS += -source 8 -target 1.8
JFLAGS += -d $(CLS)
# / cfg

# \ src
J += $(shell find sources -type f -regex ".+.java$$")
S += $(J)
# / src

CLASS = $(shell echo $(J) | sed "s/sources/classes/g" | sed "s/\.java/\.class/g")

###############################################################################

all: build/$(MODULE).jar
jar: build/$(MODULE).jar
	java -jar $<

PACKAGE  = com.nc.edu.ta.pr1
PACKPATH = $(shell echo $(PACKAGE) | sed "s/\./\//g")

build: build/$(MODULE).jar
build/$(MODULE).jar: $(CLASS) Makefile
	$(JAR) cfm $@ res/manifest.mf -C classes $(PACKPATH)
	$(JAR) tf  $@

compile: $(CLASS)
$(CLASS): $(J)
	$(JAVAC) $(JFLAGS) $^

MAIN = Example1
MAIN = $(PACKAGE).MainClass

run test: $(CLASS)
	$(JAVA) $(MAIN) $(shell ls)

docs: $(J)
	javadoc -private $(J)

###############################################################################

.PHONY: install $(OS)_install
install: $(OS)_install
$(OS)_install:
	sudo apt update
	sudo apt install -u `cat apt.txt`

MERGE  = Makefile README.md apt.txt .gitignore $(S) .vimrc
MERGE += tmp $(SRC) $(CLS) $(RES) $(BLD)

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
