#!/usr/bin/make -f

MAINCLASS ?= Example1

-include vars.mk

example: classes/Example1.class
	$(JAVA) $(MAINCLASS) arg1 arg2 arg3
classes/Example1.class: src/Example1.java *.mk
	$(JAVAC) $<
