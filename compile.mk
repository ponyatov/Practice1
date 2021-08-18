#!/usr/bin/make -f

-include vars.mk

JFILES = $(shell find $(SRC)/$(PACKPATH) -type f -regex ".+.java$$")

compile:
	rm -rf $(CLS)/com
	$(JAVAC) $(JFLAGS) $(JFILES)
