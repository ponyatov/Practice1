#!/usr/bin/make -f

-include vars.mk

MERGE  = README.md apt.txt .gitignore $(S) .vimrc
MERGE += lib tmp $(BIN) $(SRC) $(CLS) $(RES)

.PHONY: dev
dev:
#	git push -v
	git checkout $@
	git pull -v
	git checkout ponymuck -- $(MERGE)

.PHONY: ponymuck
ponymuck:
	git push -v
	git checkout $@
#	git pull -v

.PHONY: release
release:
	git tag $(NOW)-$(REL)
	git push -v && git push -v --tags
	$(MAKE) ponymuck
