default:html

vpath %.md 
vpath %.md src/GPT-2

stable-diffusion = src/stable-diffusion/overview.md src/stable-diffusion/scene-analysis/README.md src/stable-diffusion/operator-analysis/README.md src/stable-diffusion/nn-analysis/README.md src/stable-diffusion/deploy/README.md src/stable-diffusion/benchmark/README.md
swin-transformer = src/swin-transformer/overview.md src/swin-transformer/scene-analysis/README.md src/swin-transformer/operator-analysis/README.md src/swin-transformer/nn-analysis/README.md src/swin-transformer/deploy/README.md src/swin-transformer/benchmark/README.md
GPT-2 = src/GPT-2/README.md
MDFILES = $(stable-diffusion) $(swin-transformer) $(GPT-2)
PDF = dist/machine-learning-nn-analysis.pdf
HTML = dist/machine-learning-nn-analysis.html

doc: pdf html

pdf:
	echo $<
	pandoc -s --toc -N --pdf-engine=xelatex -V mainfont="Noto Sans CJK JP" -V colorlinks -V urlcolor=NavyBlue $(MDFILES) -o $(PDF)

html:
	pandoc -s --toc --self-contained --metadata pagetitle="machine-learning-nn-analysis" $(MDFILES) -o $(HTML)

view-html:
	firefox $(HTML)

view-pdf:
	firefox $(PDF)

clean:
	-rm -rf ./dist/*

