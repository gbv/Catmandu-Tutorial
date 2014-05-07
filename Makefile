TITLE  = Catmandu Tutorial
AUTHOR = Jakob Voß
SOURCE = tutorial.md

include vzgspec/Makefile

test: 
	@./testdoc.pl

new: test
	@make html pdf

tidy: clean
	ls *.src.md | sed s/\.src// | xargs rm -f

.PHONY: test
