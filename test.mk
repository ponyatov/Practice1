#!/usr/bin/make -f

-include vars.mk

.PHONY: test
test: tmp/test
tmp/test: $(J)
	./build.mk
	$(JAVA) -cp $(CLS) -jar $(JUNIT) \
		org.junit.runner.JUnitCore \
			$(PACKAGE).operations.tests.OperationTest
	touch $@