#!/usr/bin/make -f

-include vars.mk

format: $(J) src/Example1.java
	java -jar $(GJF) --replace $^
