all:
	vi answers.Rmd
	Rscript -e 'rmarkdown::render("answers.Rmd")'
	cp answers.html docs/index.html

view:
	google-chrome answers.html
