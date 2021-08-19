#!/usr/bin/make -f

-include vars.mk

.PHONY: compile
compile: $(J)
	rm -rf $(CLS)/com
	$(JAVAC) $(JFLAGS) $(J)
