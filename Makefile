TITLE  = Catmandu Tutorial
AUTHOR = Jakob Voß
SOURCE = tutorial.md

include vzgspec/Makefile

tests: 
	@./testdoc.pl

new: tests
	@make html pdf

.PHONY: tests
