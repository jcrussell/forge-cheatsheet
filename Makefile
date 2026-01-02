# The name of your main file (without the .tex extension)
PROJECT = main

# Explicitly set the compiler to xelatex (required for fontspec)
COMPILER = xelatex

# latexmk flags
# -pdfxe      : Generate PDF using xelatex
# -use-make   : Tell latexmk to use this Makefile for dependencies
# -interaction=nonstopmode : Don't halt on every error
FLAGS = -pdfxe -pdflatex="$(COMPILER) -interaction=nonstopmode" -use-make

# Default target: Build the PDF
all: $(PROJECT).pdf

# Rule to generate the PDF
$(PROJECT).pdf: $(PROJECT).tex
	latexmk $(FLAGS) $(PROJECT).tex

# 'clean' removes auxiliary files (log, aux, etc.) but keeps the PDF
clean:
	latexmk -c

# 'distclean' removes everything, including the final PDF
distclean:
	latexmk -C

# 'watch' mode: continuously recompiles when you save the file
watch:
	latexmk $(FLAGS) -pvc $(PROJECT).tex

.PHONY: all clean distclean watch
