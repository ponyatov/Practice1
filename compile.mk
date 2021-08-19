#!/usr/bin/make -f

-include vars.mk

JFILES = $(shell find $(SRC)/$(PACKPATH) -type f -regex ".+.java$$")

.PHONY: compile
compile: tmp/compile
tmp/compile: $(J)
	rm -rf $(CLS)/com
	$(JAVAC) $(JFLAGS) $(JFILES)
	touch $@
