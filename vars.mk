PACKAGE   = com.nc.edu.ta.pr1
PACKPATH  = $(shell echo $(PACKAGE) | sed "s/\./\//g")
MAINCLASS = $(PACKAGE).MainClass

# \ var
# detect module/project name by current directory
MODULE  = $(notdir $(CURDIR))
# detect OS name (only Linux in view)
OS      = $(shell uname -s)
# current date in the `ddmmyy` format
NOW     = $(shell date +%d%m%y)
# git release hash: four hex digits (for snapshots)
REL     = $(shell git rev-parse --short=4 HEAD)
# / var

# \ dir
# current (project) directory
CWD     = $(CURDIR)
# .java source code
SRC     = src
# temporary/generated files
TMP     = tmp
# compiled classes
CLS     = classes
# resources
RES     = res
# / dir

# \ version
JUNIT_VER = 4.13.2
GJF_VER   = 1.11.0
# / version

# \ tool
CURL    = curl -L -o
JAVAC   = javac
JAVA    = java
JAR     = jar
ANTLR   = antlr4
GJF     = lib/google-java-format-$(GJF_VER).jar
JUNIT   = lib/junit-$(JUNIT_VER).jar
# / tool

# \ src
J += $(shell find src -type f -regex ".+.java$$")
S += $(J)
S += $(shell ls *.mk)
# / src

# .class files list from $(J)
CLASS = $(shell echo $(J) | sed "s/src/classes/g" | sed "s/\.java/\.class/g")

# Java compiler flags
JPATH  += -cp $(CLS)
JPATH  += -cp $(JUNIT)
JFLAGS += -d $(CLS) $(JPATH)
