#!/usr/bin/make -f

-include vars.mk

MAINCLASS = Example1

example: classes/Example1.class
	$(JAVA) -cp $(CLS) $(MAINCLASS) arg1 arg2 arg3
classes/Example1.class: src/Example1.java
	$(JAVAC) $(JFLAGS) $<
