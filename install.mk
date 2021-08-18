#!/usr/bin/make -f

-include vars.mk

install: $(OS)_install
	$(MAKE) lib/$(JUNIT_JAR)
Linux_install:
	sudo apt update
	sudo apt install -u `cat apt.txt`

lib/$(JUNIT_JAR):
	$(CURL) $@ https://search.maven.org/remotecontent?filepath=junit/junit/$(JUNIT_VER)/$(JUNIT_JAR)
