JAVACFLAGS ?= -d bin/
JAVAFLAGS ?= -classpath bin/

.PHONY: run
run: bszgame.jar
	java -jar bszgame.jar

bszgame.jar: bin/Main.class
	jar -cf $@ $^

bin/Main.class: src/Main.java | bin
	javac $(JAVACFLAGS) $<

bin:
	mkdir -p $@
