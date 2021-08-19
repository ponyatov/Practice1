#!/usr/bin/make -f

-include vars.mk

install: $(OS)_install gjf junit

Linux_install:
ifneq (,$(shell which apt))
	sudo apt update
	sudo apt install -u `cat apt.txt`
endif

hamcrest: $(HAMCREST)
$(HAMCREST):
	$(CURL) $@ https://search.maven.org/remotecontent?filepath=org/hamcrest/hamcrest/$(HAMCREST_VER)/$(HAMCREST_JAR)

junit: $(JUNIT) $(HAMCREST)
$(JUNIT):
	$(CURL) $@ https://search.maven.org/remotecontent?filepath=junit/junit/$(JUNIT_VER)/$(JUNIT_JAR)

gjf: $(GJF)
$(GJF):
	$(CURL) $@ https://github.com/google/google-java-format/releases/download/v$(GJF_VER)/google-java-format-$(GJF_VER)-all-deps.jar
