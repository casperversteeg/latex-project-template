# target = the thing to generate, so executables or object files
# dependency (or prerequisite) = file(s) used to create the target
# action (or recipe) = what 'make' actually does to turn dependency into target
#
# Macros:
#	$@ = target
# $< = first dependency
# $^ = all dependencies
# %  = pattern to watch in both target and dependency

# output: main.o dependency1.o dependency2.o ...
# 	g++ main.o dependency1.o dependency2.o ... -o <executable_name>
#
# target: dependencies
#		action

MAIN=main
BUILD_DIR=build
PACK_DIR=packages
BIB_DIR=bibliography
# SOURCES:=$(MAIN).tex Makefile $(BIB_DIR)/*.bib # yourothertexfiles
# FIGURES:=$(shell find figures/* images/* -type f)
export TEXINPUTS:=.:./$(PACK_DIR):~/$(PACK_DIR):${TEXINPUTS}

LATEX_OPTS=-interaction=nonstopmode -shell-escape -aux-directory=$(BUILD_DIR)

# type `make` to run this:
all: $(MAIN).pdf

.PHONY: clean

# type `make clean` to run this:
clean:
	rm -rf $(BUILD_DIR)/* *.blg *.out *.bbl *.log *.ind *.ilg *.lot *.lof *.ind *.idx *.aux *.toc

superclean:
	make clean
	rm *.pdf

index: $(MAIN).pdf
	makeindex $(BUILD_DIR)/$(MAIN)


bib: $(MAIN).pdf
	biber $(MAIN).bbl
	pdflatex $(LATEX_OPTS) -quiet $(MAIN).tex
	pdflatex $(LATEX_OPTS) -quiet $(MAIN).tex
	pdflatex $(LATEX_OPTS) -quiet $(MAIN).tex

force:
	touch $(MAIN).tex
	make

# type `make verbose` to see all of the pdflatex output
verbose: *.tex $(BIB_DIR)/*.bib $(PACK_DIR)/*.sty
	pdflatex $(LATEX_OPTS) $(MAIN).tex
	pdflatex $(LATEX_OPTS) $(MAIN).tex
	pdflatex $(LATEX_OPTS) $(MAIN).tex

# will be invoked everywhere there is a `target: $(MAIN).pdf` (i.e. a dependency)
$(MAIN).pdf: *.tex $(BIB_DIR)/*.bib $(PACK_DIR)/*.sty
	pdflatex $(LATEX_OPTS) -quiet $(MAIN).tex
	pdflatex $(LATEX_OPTS) -quiet $(MAIN).tex
	pdflatex $(LATEX_OPTS) -quiet $(MAIN).tex
