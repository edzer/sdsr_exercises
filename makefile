all:
	quarto render

publish:
	#rm -fr docs/*
	#cp -r _book/* docs/
	#git add docs
	git commit -a -m update
	git push

view:
	google-chrome _book/index.html

R:
	R -e 'knitr::purl("01.qmd")'
	R -e 'knitr::purl("02.qmd")'
	R -e 'knitr::purl("03.qmd")'
	R -e 'knitr::purl("04.qmd")'
	R -e 'knitr::purl("05.qmd")'
	R -e 'knitr::purl("06.qmd")'
	R -e 'knitr::purl("07.qmd")'
	R -e 'knitr::purl("08.qmd")'
	R -e 'knitr::purl("09.qmd")'
	R -e 'knitr::purl("10.qmd")'
	R -e 'knitr::purl("11.qmd")'
	R -e 'knitr::purl("12.qmd")'
	R -e 'knitr::purl("13.qmd")'
	R -e 'knitr::purl("14.qmd")'
	R -e 'knitr::purl("15.qmd")'
	R -e 'knitr::purl("16.qmd")'
	R -e 'knitr::purl("17.qmd")'
