all:
	quarto render

publish:
	rm docs/*
	cp -r _book/* docs/
	git add docs

view:
	google-chrome _book/index.html
