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
# / dir

# \ tool
# http/ftp download tool
CURL    = curl -L -o
# / tool

# \ src
J += $(shell find src -type f -regex ".+.java$$")
S += $(J)
S += $(shell ls *.mk)
# / src

all:

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
