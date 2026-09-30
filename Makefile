JAVACFLAGS ?= -Xlint:deprecation

.PHONY: run
run: bszgame/Main.class
	java bszgame.Main

bszgame/Main.class: bszgame/Main.java
	javac $(JAVACFLAGS) $<
