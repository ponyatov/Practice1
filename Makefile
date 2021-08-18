# \ var
# detect module/project name by current directory
MODULE  = $(notdir $(CURDIR))
# detect OS name (only Linux in view)
OS      = $(shell uname -s)
# current date in the `ddmmyy` format
NOW     = $(shell date +%d%m%y)
# release hash: four hex digits (for snapshots)
REL     = $(shell git rev-parse --short=4 HEAD)
# current branch
BRANCH  = $(shell git rev-parse --abbrev-ref HEAD)
# number of CPU cores (for parallel builds)
CORES   = $(shell grep processor /proc/cpuinfo| wc -l)
# / var

# \ dir
# current (project) directory
CWD     = $(CURDIR)
# compiled/executable files (target dir)
BIN     = $(CWD)/build
# source code (not for all languages, Rust/C included)
SRC     = $(CWD)/src
# temporary/generated files
TMP     = $(CWD)/tmp
CLS     = $(CWD)/classes
RES     = $(CWD)/res
# / dir

# \ tool
# http/ftp download tool
CURL    = curl -L -o
JAVAC   = javac -d $(CLS)
JAVAC   = javac -cp $(CLS);lib/$(JUNIT_JAR)
JAR     = jar
ANTLR   = antlr4
# / tool

# \ cfg
# JFLAGS += -source 8 -target 1.8
JFLAGS += -d $(CLS)

MAINCLASS = $(PACKAGE).MainClass
# / cfg

# \ src
J += $(shell find src -type f -regex ".+.java$$")
S += $(J)
S += $(shell ls *.mk)
# / src

CLASS = $(shell echo $(J) | sed "s/src/classes/g" | sed "s/\.java/\.class/g")

###############################################################################

all: $(BIN)/$(MODULE).jar
jar: $(BIN)/$(MODULE).jar
	java -jar $<

PACKAGE  = com.nc.edu.ta.pr1
PACKPATH = $(shell echo $(PACKAGE) | sed "s/\./\//g")

build: $(BIN)/$(MODULE).jar
$(BIN)/$(MODULE).jar: $(CLASS) Makefile
	$(JAR) cfm $@ res/manifest.mf -C classes $(PACKPATH)
	$(JAR) tf  $@

compile: $(CLASS)
$(CLASS): $(J)
	$(JAVAC) $(JFLAGS) $^

run: $(CLASS)
	$(JAVA) $(MAINCLASS) $(shell ls)

.PHONY: docs
docs: $(J)
	javadoc -d $@ -private $(J)

.PHONY: test
test: $(BIN)/$(MODULE).jar lib/$(JUNIT_JAR)
	$(JAVA) -cp $(BIN)/$(MODULE).jar;lib/$(JUNIT_JAR) \
		org.junit.runner.JUnitCore \
			$(PACKAGE).operation.tests.OperationTest

###############################################################################

MERGE  = Makefile README.md apt.txt .gitignore $(S) .vimrc
MERGE += lib tmp $(BIN) $(SRC) $(CLS) $(RES)

.PHONY: dev
dev:
#	git push -v
	git checkout $@
#	git pull -v
	git checkout ponymuck -- $(MERGE)

.PHONY: ponymuck
ponymuck:
#	git push -v
	git checkout $@
#	git pull -v

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
