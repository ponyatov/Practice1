#!/usr/bin/make -f

-include vars.mk

.PHONY: test
test: $(J)
	./build.mk
	$(JAVA) $(JPATH) \
		org.junit.runner.JUnitCore \
			$(PACKAGE).operations.tests.OperationTest
