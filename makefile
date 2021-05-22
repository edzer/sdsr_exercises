all:
	vi answers.Rmd
	Rscript -e 'rmarkdown::render("answers.Rmd")'

view:
	google-chrome answers.html
