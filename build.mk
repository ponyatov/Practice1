#!/usr/bin/make -f

-include vars.mk

.PHONY: build
build: build/$(MODULE).jar
build/$(MODULE).jar: $(J)
	./compile.mk
	$(JAR) cfm $@ res/manifest.mf -C $(CLS) $(PACKPATH)
	$(JAR) tf  $@
