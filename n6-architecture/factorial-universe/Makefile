.PHONY: notebooks paper clean all

NOTEBOOKS = $(wildcard notebooks/*.ipynb)

all: notebooks paper

notebooks:
	@echo "Running all notebooks..."
	@for nb in $(NOTEBOOKS); do \
		echo "  → $$nb"; \
		jupyter nbconvert --to notebook --execute --inplace $$nb; \
	done

paper: paper.tex paper.bib
	tectonic paper.tex

clean:
	rm -f paper.aux paper.bbl paper.blg paper.log paper.out paper.pdf
	rm -f figures/*.pdf figures/*.png
