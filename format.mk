#!/usr/bin/make -f

-include vars.mk

format: tmp/format
tmp/format: $(J)
	$(JAVA) -jar $(GJF) --replace $?
	touch $@
