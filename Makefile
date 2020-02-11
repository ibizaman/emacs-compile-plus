emacs ?= emacs
# EMACS = emacs-24.3

LOAD = -l emacs-compile-plus.el -l emacs-compile-plus-test.el

.PHONY: all test clean checkdoc

all: compile test checkdoc

test:
	$(emacs) -batch $(LOAD) -f ert-run-tests-batch-and-exit

checkdoc:
	$(emacs) -batch -l targets/checkdoc.el

compile:
	$(emacs) -batch -l targets/emacs-compile-plus-init.el

run:
	$(emacs) -Q -l targets/emacs-compile-plus-init.el

clean:
	rm -f *.elc
