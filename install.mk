#!/usr/bin/make -f

-include vars.mk

install: $(OS)_install
	$(MAKE) $(GJF) $(JUNIT)

Linux_install:
	sudo apt update
	sudo apt install -u `cat apt.txt`

junit: $(JUNIT)
$(JUNIT):
	$(CURL) $@ https://search.maven.org/remotecontent?filepath=junit/junit/$(JUNIT_VER)/$(JUNIT_JAR)

gjf: $(GJF)
$(GJF):
	$(CURL) $@ https://github.com/google/google-java-format/releases/download/v$(GJF_VER)/google-java-format-$(GJF_VER)-all-deps.jar
