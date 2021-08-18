#!/usr/bin/make -f

-include vars.mk

.PHONY: docs
docs: $(J)
	javadoc $(JFLAGS) -private $(J)
