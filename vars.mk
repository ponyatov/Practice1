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
# current branch
BRANCH  = $(shell git rev-parse --abbrev-ref HEAD)
# number of CPU cores (for parallel builds)
CORES   = $(shell grep processor /proc/cpuinfo| wc -l)
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

# Java class-path
CP = $(CLS)

# \ jar
JUNIT_VER    = 4.13.2
JUNIT_JAR    = junit-$(JUNIT_VER).jar
JUNIT        = lib/$(JUNIT_JAR)
CP += $(JUNIT)

HAMCREST_VER = 2.2
HAMCREST_JAR = hamcrest-$(HAMCREST_VER).jar
HAMCREST     = lib/$(HAMCREST_JAR)
CP += $(HAMCREST)

GJF_VER      = 1.11.0
GJF_JAR      = google-java-format-$(GJF_VER).jar
GJF          = lib/$(GJF_JAR)
# / jar

# \ tool
CURL    = curl -L -o
JAVAC   = $(JAVA_HOME)/bin/javac
JAVA    = $(JAVA_HOME)/bin/java
JAR     = $(JAVA_HOME)/bin/jar
ANTLR   = antlr4
# / tool

# \ src
J += $(shell find $(SRC)/$(PACKPATH) -type f -regex ".+.java$$")
S += $(J) src/Example1.java
S += $(shell ls *.mk)
# / src

# .class files list from $(J)
CLASS = $(shell echo $(J) | sed "s/src/classes/g" | sed "s/\.java/\.class/g")

# Java compiler flags
JPATH  += -cp $(shell echo $(CP) | sed "s/ /:/g")
JFLAGS += -d $(CLS) $(JPATH)
