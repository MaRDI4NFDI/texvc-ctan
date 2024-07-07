PACKAGE = texvc
all: $(PACKAGE).pdf

$(PACKAGE).sty: $(PACKAGE).dtx $(PACKAGE).ins
	pdflatex $(PACKAGE).ins

$(PACKAGE).idx: $(PACKAGE).dtx $(PACKAGE).sty
	pdflatex $(PACKAGE).dtx

$(PACKAGE).ind: $(PACKAGE).idx $(PACKAGE).sty
	makeindex -s gind.ist $(PACKAGE).idx

$(PACKAGE).gls: $(PACKAGE).idx $(PACKAGE).sty
	makeindex -s gglo.ist -o $(PACKAGE).gls $(PACKAGE).glo

$(PACKAGE).pdf: $(PACKAGE).dtx $(PACKAGE).sty $(PACKAGE).ind $(PACKAGE).gls
	pdflatex $(PACKAGE).dtx
