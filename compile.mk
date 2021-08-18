#!/usr/bin/make -f

-include vars.mk

compile:
	rm -rf $(CLS)/com
	$(JAVAC) $(JFLAGS) $(J)
