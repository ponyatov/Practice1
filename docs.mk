#!/usr/bin/make -f

-include vars.mk

.PHONY: docs
docs: $(J)
	javadoc $(JPATH) -d $@ -private $(J)
