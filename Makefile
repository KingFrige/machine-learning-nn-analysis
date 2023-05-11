default:doc

MDFILES = src/stable-diffusion/README.md src/GPT-2/README.md
PDF = dist/machine-learning-nn-analysis.pdf
HTML = dist/machine-learning-nn-analysis.html

doc: pdf html

pdf:
	pandoc -s --toc --pdf-engine=xelatex -V mainfont="Noto Sans CJK JP" -V colorlinks -V urlcolor=NavyBlue $(MDFILES) -o $(PDF)

html:
	pandoc -s --toc --self-contained --metadata pagetitle="machine-learning-nn-analysis" $(MDFILES) -o $(HTML)

view:
	firefox $(PDF)

clean:
	-rm -rf ./dist/*

