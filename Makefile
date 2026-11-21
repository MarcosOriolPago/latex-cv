# Build the CV with Typst (https://typst.app). Fonts in ./fonts are picked up if present.
TYPST ?= typst
FLAGS  = --font-path fonts

.PHONY: all pdf watch preview clean

all: pdf preview

pdf:
	$(TYPST) compile $(FLAGS) cv.typ cv.pdf

watch:
	$(TYPST) watch $(FLAGS) cv.typ cv.pdf

# PNG of the first page, used in the README
preview:
	$(TYPST) compile $(FLAGS) --format png --ppi 110 --pages 1 cv.typ preview.png

clean:
	rm -f cv.pdf preview.png
