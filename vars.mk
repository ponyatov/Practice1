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
SRC     = $(CWD)/src
# temporary/generated files
TMP     = $(CWD)/tmp
# compiled classes
CLS     = $(CWD)/classes
# resources
RES     = $(CWD)/res
# / dir

# \ tool
JAVAC   = javac -d $(CLS)
JAVA    = java -cp $(CLS)
JAR     = jar
ANTLR   = antlr4
# / tool

# \ jar
JUNIT_VER = 4.13.2
JUNIT_JAR = junit-$(JUNIT_VER).jar
# / jar
