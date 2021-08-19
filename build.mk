#!/usr/bin/make -f

-include vars.mk

.PHONY: build build/$(MODULE).jar
build: build/$(MODULE).jar
build/$(MODULE).jar:
	rm -f $@
	./compile.mk
	$(JAR) cfm $@ res/manifest.mf -C $(CLS) $(PACKPATH)
	$(JAR) tf  $@
