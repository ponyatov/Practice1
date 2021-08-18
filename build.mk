#!/usr/bin/make -f

-include vars.mk

build: build/$(MODULE).jar

.PHONY: build/$(MODULE).jar
build/$(MODULE).jar:
	$(MAKE) -f compile.mk
	$(JAR) cfm $@ res/manifest.mf -C classes $(PACKPATH)
	$(JAR) tf  $@
