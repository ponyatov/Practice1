#!/usr/bin/make -f

-include vars.mk

test:
	$(JAVA) $(JPATH) \
		org.junit.runner.JUnitCore \
			$(PACKAGE).operations.tests.OperationTest
